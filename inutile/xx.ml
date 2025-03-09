open Yojson.Basic

type data_item = {
  id : int;
  value : int;
}

let generate_data () =
  Random.self_init ();
  let data = Array.init 10 (fun i -> { id = i; value = Random.int 100 }) in
  let json_data = `List (Array.to_list (Array.map (fun item -> `Assoc [("id", `Int item.id); ("value", `Int item.value)]) data)) in
  let json_string = Yojson.Basic.pretty_to_string json_data in
  let oc = open_out "data.json" in
  output_string oc json_string;
  close_out oc;
  print_endline "Data generated and saved to data.json"

let () = generate_data ()