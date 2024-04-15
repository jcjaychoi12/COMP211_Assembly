# COMP 311 Spring 2023: Final Project

## Binary Pattern Generation

## Final Project Objective

In the final project, you will be implementing a MIPS program that utilizes recursion. Recursion is the process a procedure goes through when one of the steps of the procedure involves invoking the procedure itself. It is one of the most important and common techniques used in computer science.

We will test your understanding of procedure calls in MIPS by asking you to write a recursive MIPS program that prints all binary patterns of length `N`.

## Coding Problem

In this project, you will write a MIPS program that reads an integer `N` ranging from 1 to 16, generates all binary patterns of length `N`, and outputs them line by line. In particular, the step-by-step procedure is:

1. Prompt the user to enter a number between 1 and 16 (inclusive), which will be the number of bits a single result string will have.
2. Write a recursive function to generate all strings that meet the condition.
3. Output all your strings. The smaller the number which the string represents in binary, the earlier it should be printed.
4. Terminate the program.
5. The I/O code is not given.

## Assignment Instructions

Reference C code is provided in the comments of `final_project.asm`.

In `final_project.asm`, complete the MIPS code in the two TODO sections:

- PART 1, in which you will complete the body of the main procedure.
- PART 2, in which you will complete the body of the recursive procedure.

## Example I/O

```
Enter the number of bits (N): 3 
000
001
010
011
100
101
110
111
```

## Program Specifications

- The name of your program file must be `final_project.asm`.
- Exception / error handling is not required. That is, assume only valid values are entered by the user.
- The input and output must be identical to the examples provided above in terms of spelling, spacing, capitalization, etc.

## Assignment Submission and Grading Rubric

Assignment submissions will be made through [Gradescope](https://www.gradescope.com).

You should already be enrolled in the COMP 311 Spring 2023 course on Gradescope. If you are not, please self enroll. If you're unable to self enroll, please contact your cohort leader and we'll manually add you.

To submit your assignment, please follow the basic steps provided below. If you're unable to perform any of the steps, please reach out to your **cohort** and **cohort leader** as soon as possible. That is, give yourself time to resolve any technical issues using GitHub, GitHub Desktop, and Gradescope well before the assignment due date.

1. Submit modifications using the **commit** GitHub Desktop instructions.
2. Update remote (origin) repository using the **push** GitHub Desktop instructions.
3. Go to the COMP 311 course in Gradescope and click on the assignment called **Final Project**.
4. Click on the option to **Submit Assignment** and choose GitHub as the submission method. You may be prompted to sign in to your GitHub account to grant access to Gradescope. When this occurs, **make sure to grant access to the Comp311-SP23 organization**.
5. You should see a list of your public repositories. Select the one named **final-project-yourname** and submit it.
6. Your assignment should be autograded within a few seconds and you will receive feedback.
7. If you receive all the points, then you have completed the project! Otherwise, you are free to keep pushing commits to your GitHub repository and submit for regrading up until LDOC.
