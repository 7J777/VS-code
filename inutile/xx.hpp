package com.example;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DataGenerator {
    static class DataItem {
        int id;
        int value;

        DataItem(int id, int value) {
            this.id = id;
            this.value = value;
        }
    }

    public static void main(String[] args) {
        Random random = new Random();
        List<DataItem> data = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            data.add(new DataItem(i, random.nextInt(100)));
        }

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        try (FileWriter writer = new FileWriter("data.json")) {
            gson.toJson(data, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("Data generated and saved to data.json");
    }
}