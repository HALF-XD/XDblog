### 代码随想录

一套完整的刷题计划，循序渐进学算法 https://programmercarl.com/

- [leetcode 刷不下去怎么办？](https://www.zhihu.com/question/386655212/answer/1895544651) 【刷算法题的】
- [计算机必读的书单（含下载方式）](https://zhuanlan.zhihu.com/p/369766867) 【分享书单的】
- [你的编程能力从什么时候开始突飞猛进？](https://www.zhihu.com/question/356351510/answer/2006069182) 【分享书单的】
- [为什么有人讨厌指针？](https://www.zhihu.com/question/432288840/answer/1798182117)【讲解指针的】
- [为什么有人说弄懂了《算法导论》的 90%，就超越了 90%的程序员？](https://www.zhihu.com/question/315201616/answer/1966522202)

https://www.zhihu.com/question/386655212/answer/2000784992
https://www.zhihu.com/question/31092580/answer/1746556336
https://www.zhihu.com/question/36149122/answer/1837141822
https://www.iamshuaidi.com/155.html

### Grind 169 questions

https://algo.monster/
https://www.techinterviewhandbook.org/
Grind 75: https://www.techinterviewhandbook.org/grind75

```txt
按照75道题目来
Easy: 25 / Medium: 41 / Hard: 9
easy
1. 【1】两数之和 <Two Sum> https://leetcode.cn/problems/two-sum/
2. 【20】有效的括号 Valid Parentheses
3. 【21】合并两个有序链表 Merge Two Sorted Lists
4. 【121】买卖股票的最佳时机 Best Time to Buy and Sell Stock
5. 【125】验证回文串 Valid Palindrome
6. 【226】翻转二叉树 Invert Binary Tree
7. 【242】有效的字母异位词 Valid Anagram
8. 【704】二分查找 Binary Search
9. 【733】图像渲染 Flood Fill
10. 【53】最大子数组和 Maximum Subarray
11. 【235】二叉搜索树的最近公共祖先 Lowest Common Ancestor of a Binary Search Tree
12. 【110】平衡二叉树 Balanced Binary Tree
13. 【141】环型链表 Linked List Cycle
```

### Leetcode 按照题目类型记录

#### 二分查找

704 - 二分查找
35 - 搜索插入位置
34 - 在排序数组中查找元素的第一个和最后一个位置
69 - x 的平方根
367 - 有效的完全平方数

### Leetcode 按题号整理

#### [1] 两数之和

【`Two Sum` -- `Easy` -- `Array`】

【link: https://leetcode.cn/problems/two-sum】

#### [4] 寻找两个正序数组的中位数

【`Median of Two Sorted Arrays` -- `Hard` -- `Array`】

【link: https://leetcode.cn/problems/median-of-two-sorted-arrays】

```
题目：
  给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
  请你找出并返回这两个正序数组的 中位数 。
  算法的时间复杂度应该为 O(log (m+n))。
```

#### [35] 搜索插入位置

```
题名：Search Insert Position
难度：Easy
标签：数组 二分查找
要求：时间复杂度为 `O(log n)`
题目：给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。
    如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
```

JavaScript 版本 1：

```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function (nums, target) {
  let left = 0;
  let right = nums.length - 1;

  while (left <= right) {
    if (target < nums[left]) {
      return left;
    }
    if (target > nums[right]) {
      return right + 1;
    }

    let mid = left + Math.floor((right - left) / 2);
    if (target < nums[mid]) {
      right = mid - 1;
    } else if (target > nums[mid]) {
      left = mid + 1;
    } else {
      return mid;
    }
  }
};
```

JavaScript 版本 2 (执行时间减少) ：

```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function (nums, target) {
  const n = nums.length;
  let left = 0,
    right = n - 1,
    ans = n;
  while (left <= right) {
    let mid = ((right - left) >> 1) + left;
    if (target <= nums[mid]) {
      ans = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return ans;
};
```

#### [217] 存在重复元素

> 题名：Contains Duplicate
> 难度：Easy
> 标签：数组

(1)数组排序，然后前后比较重复

(2)hash 表

#### [704] 二分查找 [Done]

> 题名：Binary Search
> 难度：Easy
> 标签：数组 二分查找

前提：有序数组，且没有重复项。也是二分法的前提。

重点：左右边界的区间问题，左闭右闭 [left, right]，左闭右开 [left, right)

JavaScript 版本：

```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function (nums, target) {
  let left = 0;
  let right = nums.length - 1; // 闭区间
  while (left <= right) {
    // let mid = (left + right) / 2; // 错在忽略了js中不整除
    // let mid = Math.floor((left + right) / 2); // 溢出状况
    let mid = left + Math.floor((right - left) / 2);
    if (target < nums[mid]) {
      right = mid - 1;
    } else if (target > nums[mid]) {
      left = mid + 1;
    } else {
      return mid;
    }
  }
  return -1;
};
```

C 版本：

```c
#include <stdio.h>

int search(int* nums, int numsSize, int target){
    int left = 0;
    int right = numsSize-1;
    int middle = 0;
    while(left<=right) {
        middle = (left+right)/2;
        if(nums[middle] > target) {
            right = middle-1;
        }
        else if(nums[middle] < target) {
            left = middle+1;
        }
        else if(nums[middle] == target){
            return middle;
        }
    }
    return -1;
}

int main(void) {
	int nums[12] = {-1,0,3,5,9,12,99,123,145,166,187,222};
	int res = search(nums, 12, 12);
	printf("%d \n",res);
	return 0;
}
```
