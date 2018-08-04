[%%version 0.3]

(* This is an experimental contract to allow proxy delegation *)

type storage = {
  voters    : (address, tez) map;
  owner     : address;
}

let%init storage = {
  (*initialize an empty map*)
  voters = (Map : (address, tez) map);
  owner = Current.source();
}

let%entry main (parameter : string) (storage : storage) =
  let sender = Current.source() in
  if sender = storage.owner && parameter <> "owner-op" then
    Current.failwith "owner operations"
  else
    match Map.find (Current.source()) storage.voters  with
    | None ->
        let storage = storage.voters <- Map.add (Current.source()) (Current.amount()) storage.voters in
        ( ([] : operation list), storage)
    | Some balance ->
        let new_balance = balance + Current.amount() in
        let storage = storage.voters <- Map.add (Current.source()) new_balance storage.voters in
        ( ([] : operation list), storage)