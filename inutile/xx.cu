#include <stdio.h>
#include <stdlib.h>
#include <curand_kernel.h>
#include <fstream>
#include <iostream>
#include <json/json.h>

__global__ void generate_data(int *ids, int *values, int n) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < n) {
        curandState state;
        curand_init(0, idx, 0, &state);
        ids[idx] = idx;
        values[idx] = curand(&state) % 100;
    }
}

int main() {
    const int n = 10;
    int ids[n], values[n];
    int *d_ids, *d_values;

    cudaMalloc((void**)&d_ids, n * sizeof(int));
    cudaMalloc((void**)&d_values, n * sizeof(int));

    generate_data<<<1, n>>>(d_ids, d_values, n);

    cudaMemcpy(ids, d_ids, n * sizeof(int), cudaMemcpyDeviceToHost);
    cudaMemcpy(values, d_values, n * sizeof(int), cudaMemcpyDeviceToHost);

    cudaFree(d_ids);
    cudaFree(d_values);

    Json::Value data(Json::arrayValue);
    for (int i = 0; i < n; ++i) {
        Json::Value item;
        item["id"] = ids[i];
        item["value"] = values[i];
        data.append(item);
    }

    std::ofstream file("data.json");
    file << data.toStyledString();
    file.close();

    return 0;
}