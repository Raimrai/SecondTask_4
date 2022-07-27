package kz.bitlab.db;

import java.util.ArrayList;

public class DBManager {
    private static Long id = 6L;

    private static ArrayList<Task> tasks =new ArrayList<>();
    static{
        tasks.add(new Task(1L,"Create web-site","Create web-site","Yes","21.07.2022"));
        tasks.add(new Task(2L,"Buy products","Buy products","Yes","18.07.2022"));
        tasks.add(new Task(3L,"Do homework","Do homework","Yes","22.07.2022"));
        tasks.add(new Task(4L,"Sign up for a gym","Sign up for a gym","No","19.07.2022"));
        tasks.add(new Task(5L,"Learn Italian language","Learn Italian language","No","31.12.2023"));

    }
    public static void addTask(Task task){
        task.setId(id);
        tasks.add(task);
        id++;
    }
    public static ArrayList<Task> getAllTasks(){return tasks;}
    public static Task getTask(Long id){
        for (Task tsk : tasks){
        if (tsk.getId()==id){
            return tsk;
        }
        }
        return null;
    }
    public static void update(Task task){
        for (int i = 0;i<tasks.size();i++){
            if (tasks.get(i).getId()==task.getId()) {
                tasks.set(i,task);
                break;
            }
        }
    }
    public static void delete(Long id ){
        for (int i = 0;i<tasks.size();i++){
            if (tasks.get(i).getId()==id) {
               tasks.remove(i);
               break;
            }
        }
    }
}
