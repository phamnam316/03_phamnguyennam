package org.example.TestingSystem_Assignment_1;
import java.util.Scanner;

public class Exercise4 {
    public static void main(String[] args){
        //question1();
        //question2();
        question3();
    };
    public static void question1(){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập xâu kí tự: ");
        String inputString = scanner.nextLine();
        String[] words = inputString.split("\\s+");
        int wordCount = words.length;
        System.out.println("Số lượng từ trong xâu là: " + wordCount);

        scanner.close();
    }

    public static void question2(){
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập xâu kí tự 1: ");
        String str1 = scanner.nextLine();
        System.out.print("Nhập xâu kí tự 2: ");
        String str2 = scanner.nextLine();
        System.out.println(" xâu kí tự sau khi nối là: " + str1.concat(str2));
        scanner.close();
    }

        public static void question3() {
            Scanner scanner = new Scanner(System.in);

            // Nhập tên từ người dùng
            System.out.print("Nhập tên: ");
            String ten = scanner.nextLine();

            // Kiểm tra xem tên có viết hoa chữ cái đầu không
            String tenVietHoa = vietHoaChuCaiDau(ten);

            // In kết quả
            System.out.println("Tên sau khi kiểm tra: " + tenVietHoa);

            scanner.close();
        }

        public static String vietHoaChuCaiDau(String ten) {
            // Kiểm tra xem tên có rỗng không
            if (ten.isEmpty()) {
                return ten;
            }

            // Chuyển tên thành chữ thường (lowercase)
            ten = ten.toLowerCase();

            // Lấy ký tự đầu tiên và viết hoa nó
            char kyTuDau = Character.toUpperCase(ten.charAt(0));

            // Ghép ký tự đầu viết hoa với phần còn lại của tên
            String tenVietHoa = kyTuDau + ten.substring(1);

            return tenVietHoa;
        }



}
