import java.io.File
import kotlin.random.Random
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
data class DataItem(val id: Int, val value: Int)

fun main() {
    val data = List(10) { DataItem(it, Random.nextInt(100)) }
    val json = Json { prettyPrint = true }.encodeToString(data)
    File("data.json").writeText(json)
}