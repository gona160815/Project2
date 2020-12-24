package main.java.sixsix.trytry;

import java.util.Calendar;
import java.util.Scanner;

public class Todaywhatweek2 {
    /**
     *  通過輸入一個年月日 獲取到當月的這個日曆 打印出來 並且[]把輸入的這個日期包起來
     * 
     */
    public static void main(String[] args) {
    	Todaywhatweek2 cal = new Todaywhatweek2();
        cal.year = cal.getInput("年");
        cal.month = cal.getInput("月");
        cal.day = cal.getInput("日期");    
        cal.printCal();
    }
    
    private int year;
    private int month;
    private int day;
    
    public int getInput(String str){
        System.out.println("請輸入"+str);
        return new Scanner(System.in).nextInt();
    }
    
    public void printCal(){
        // 日曆 6行 7列  通過Caldendar.set(year, month, day) 當月的日曆
        int[][] arr = new int[6][7];
        Calendar cal = Calendar.getInstance();
        cal.set(year, month, 0);   //若為0，month則不需-1
        
        int max = cal.get(Calendar.DAY_OF_MONTH);
        System.out.println(max);
        // 星期天開始的
        for(int i=1;i<=max;i++){
            cal.set(year, month-1, i);  //若不為0，month則需-1
            int row = cal.get(Calendar.WEEK_OF_MONTH)-1;
            int col = cal.get(Calendar.DAY_OF_WEEK)-1;
            arr[row][col] = i;
        }
        
        System.out.println("日\t一\t二\t三\t四\t五\t六");
        for(int x=0;x<arr.length;x++){
            for(int y=0;y<arr[x].length;y++){
                if(arr[x][y] != 0){
                    if(arr[x][y] == day){
                        System.out.print("["+arr[x][y]+"]");
                    }else{
                        System.out.print(arr[x][y]);
                    }
                }
                System.out.print("\t");
            }
            System.out.println();
        }
    }
    

}