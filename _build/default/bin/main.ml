type task = {
        id : int;
        description : string;
        completed : bool;
}

type todo_list = task list

let add_task (list : todo_list) (desc : string) : todo_list =
        let new_task = { id = List.length list + 1; description = desc; completed = false } in 
        list @ [new_task]

let complete_task (list : todo_list) (task_id : int) : todo_list =
        List.map (fun t -> if t.id = task_id then { t with completed = true } else t) list

let print_task (t : task) : unit =
        Printf.printf "[%d] %s - %s\n" t.id t.description (if t.completed then "Completed" else "Pending")

let print_todo_list (list : todo_list) : unit =
        List.iter print_task list

(* Example usage *)
let () =
        let todo_list = ref [] in
        todo_list := add_task !todo_list "Buy groceries";
        todo_list := add_task !todo_list "Finish homework";
        print_todo_list !todo_list;
        todo_list := complete_task !todo_list 1;
        print_todo_list !todo_list;
