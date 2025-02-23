package demo;

public class MergeSort {

    // 主函数，负责调用归并排序函数
    public static void main(String[] args) {
        int[] array = {1, 1, 1, 12, 11, 1, 13, 5, 1, 1, 1};
        System.out.println("给定数组：");
        printArray(array);


        System.out.println("\n排序后的数组：");
        printArray(sort(array, 0, array.length - 1));
    }

    // 归并排序函数
    public static int[] sort(int[] array, int start, int end) {
        if (start == end) {
            return new int[]{array[start]};
        }
        int i = 0;
        int j = 0;
        int k = 0;
        int middle = (start + end) >> 1;

        int[] left = sort(array, start, middle);
        int[] right = sort(array, middle + 1, end);
        int[] third = new int[left.length + right.length];

        while (i < left.length && j < right.length) {
            third[k++] = (left[i] < right[j] ? left[i++] : right[j++]);
        }
        while (i < left.length) {
            third[k++] = left[i++];
        }
        while (j < right.length) {
            third[k++] = right[j++];
        }
        return third;
    }


    // 打印数组
    static void printArray(int[] array) {
        for (int j : array) System.out.print(j + " ");
        System.out.println();
    }
}