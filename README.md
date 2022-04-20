# FengShuiApp

The purpose of this app is to generate a grid of numbers upon specifying:
  1. Luck
  2. Location

## Formula
Each set of numbers in the grid is generated with this formula (clockwise and anti-clockwise respectively):\
 \
<img width="416" alt="Screen Shot 2022-04-20 at 2 21 55 pm" src="https://user-images.githubusercontent.com/44921579/164149951-95d449f6-52ff-4c67-8d7a-9c1b3e87cd68.png">

## Locations and Directions (坐向)
Location always points to the direct opposite Direction.\
 \
Each have a gender which determines the formula rotation.
  - Male = Clockwise
  - Female = Anti-clockwise

**There are 24 of each:**

![0b13c83b5e454ee7a9fc719d018100cd](https://user-images.githubusercontent.com/44921579/164150576-60d30187-fb29-4d0d-867e-692bf3876239.png)

## Generated Grid
The grid consists of 3 generated sets of numbers.

1. Base numbers (in Chinese)
    - Center number is the specified Luck number
    - Formula is always clockwise

2. Location numbers (top-left of grid items)
    - Center number is the base number that contains the specified Location character
    - Formula is found by referring to the Original Grid

3. Direction numbers (top right of grid items)
    - Center number is the base number that contains the Direction character
    - Formula is found by referring to the Original Grid

## Original Grid
A static grid that should be referenced when generating the dynamic grid.\
It is the grid specified above with 5 as the center number.

## How it works
1. `UserInput` specifies `Luck` **and** `Location`
2. Base numbers are generated, each with 3 associated `Location`s
3. Find which base number contains specified `Location` and its index (can only be 0/1/2)
4. Find this number on Original Grid and its associated `Location` using the index to work out the formula `rotation`
5. Location numbers are generated with number found above as the center, using the `rotation` from above step
6. Repeat steps 3-5 for `Direction` instead of `Location` to generate direction numbers
7. Display in `GridView`

## How it looks
<img width="375" alt="testCombinations 1-運-丁-坐" src="https://user-images.githubusercontent.com/44921579/164153247-9022994c-3f80-414f-97c9-01e8c91aa092.png">
