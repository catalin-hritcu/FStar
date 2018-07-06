module Registers.Fun
type reg = int
type regmap a = int -> a

[@(plugin 2)]
let create #a (x:a) : regmap a = fun _ -> x

[@(plugin 3)]
let sel #a (r:regmap a) (x:reg) : Tot a = r x

let sel' #a (r:regmap a) (x:reg) : Tot a = sel r x

[@(plugin 4)]
let upd #a (r:regmap a) (x:reg) (v:a) : regmap a = fun y -> if x = y then v else r y

[@(plugin 4)]
let const_map_n #a (n:nat) (x:a) (r:regmap a) : regmap a = fun _ -> x

// [@(plugin 2)]
// let identity_map (n:int) (r:regmap int) : regmap int = fun x -> x

let eta_map (n:nat) (r:regmap 'a) : regmap 'a =
  let rec aux (n:nat) (out:regmap 'a) : regmap 'a =
    if n=0 then out
    else aux (n - 1) (upd out n (sel' r n))
  in
  aux n (create (sel' r 0))
