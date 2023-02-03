# Waterworks

This app has 2 main purposes, both based off of user input:
  1. Generate a grid based on Luck and Location
  2. Generate a grid based on Year

## Formula
Each set of numbers in the grid is generated with this formula (clockwise and anti-clockwise respectively):\
 \
<img width="416" alt="Screen Shot 2022-04-20 at 2 21 55 pm" src="https://user-images.githubusercontent.com/44921579/164149951-95d449f6-52ff-4c67-8d7a-9c1b3e87cd68.png">

## Direction Grid (坐向)

### Locations and Directions
Location always points to the direct opposite Direction.\
Each have a gender which determines the formula rotation.
  - Male = Clockwise
  - Female = Anti-clockwise

**There are 24 of each:**

![0b13c83b5e454ee7a9fc719d018100cd](https://user-images.githubusercontent.com/44921579/164150576-60d30187-fb29-4d0d-867e-692bf3876239.png)

### Generated Grid
The grid consists of 3 generated sets of numbers.
Each grid item also has a Cardinal Point.

1. Base numbers (in Chinese)
    - Center number is the specified Luck number
    - Formula is always clockwise

2. Location numbers (top-left of grid items)
    - Center number is the base number that contains the specified Location character
    - Formula is found by referring to the Original Grid

3. Direction numbers (top right of grid items)
    - Center number is the base number that contains the Direction character
    - Formula is found by referring to the Original Grid

4. Cardinal points (bottom right of grid items in red)
    - Each grid item represents a direction (N, S, E, W, NE, NW, SE, SW)
    - Each direction has a chinese character representation which is what is displayed.

### Original Grid
A static grid that should be referenced when generating the dynamic grid.\
It is the grid specified above with 5 as the center number.

### How it works
1. `UserInput` specifies `Luck` **and** `Location`
2. Base numbers are generated, each with 3 associated `Location`s
3. Find which base number contains specified `Location` and its index (can only be 0/1/2)
4. Find this number on Original Grid and its associated `Location` using the index to work out the formula `rotation`
5. Location numbers are generated with number found above as the center, using the `rotation` from above step
6. Repeat steps 3-5 for `Direction` instead of `Location` to generate direction numbers
7. Display in `GridView`


### How it looks
<img width="375" src="https://user-images.githubusercontent.com/44921579/200208978-f885d159-7473-40cf-8d6b-69792e5c475d.png">

## Year Grid (三煞太歲)

### Year
Every year can be represented by a number between 1-9 in a continuous loop.\
This number is used as the center number in the grid.\
So for example, if starting from 2022:
- 2022 = 5
- 2023 = 4
- 2024 = 3
- 2025 = 2
- 2026 = 1
- 2027 = 9
- 2028 = 8
- 2029 = 7
- 2030 = 6
- 2031 = 5

### Heaven Stems and Earth Branches (天干, 地支)
Every year can also be represented by a heaven stem and earth branch pair.\
\
There are 10 heaven stems that loop continuously:
- 庚, 辛, 壬, 癸, 甲, 乙, 丙, 丁, 戊, 己

There are 12 earth branches that loop continuously:
- 子, 丑, 寅, 卯, 辰, 巳, 午, 未, 申, 酉, 戌, 亥

The two are paired like so and are ongoing (each looping individually):
- 甲子
- 乙丑
- 丙寅
- 丁卯
- 戊辰
- 己巳
- 庚午
- 辛未
- 壬申
- 癸酉
- 甲戌
- 乙亥
- 丙子

The pairs loop around the year like so:
- 2022 = 壬寅
- 2023 = 癸卯
- 2024 = 甲辰
- 2025 = 乙巳
- 2026 = 丙午
- 2027 = 丁未
- 2028 = 戊申
- 2029 = 己酉
- 2030 = 庚戌
- 2031 = 辛亥

### Evil (三煞)
Each earth branch has a cardinal point (N, S, E, W).\
The Evil position can be found by using the cardinal point of the earth branch that is representing the selected year. 
- N = 寅, 午, 戌
- S = 申, 子, 辰
- E = 巳, 酉, 丑
- W = 亥, 卯, 未

### Age (太歲)
Each earth branch has a number.\
The Age position can be found by using the number of the earth branch that is representing the selected year.
- 1 = 子
- 2 = 未, 申
- 3 = 卯
- 4 = 辰, 巳
- 6 = 亥, 戌
- 7 = 酉
- 8 = 寅, 丑
- 9 = 午

### Strength (力)
Each earth branch has a strength character. And each strength character has a direction.
This means that strength will only ever be located in the corners.

- 寅 = NE = 亥, 子, 丑
- 巳 = SE = 寅, 卯, 辰 
- 申 = SW = 巳, 午, 未 
- 亥 = NW = 申, 酉, 戌 

1. Find the year's earth branch, then the strength of the earth branch
2. Find the strength character in the Original Grid, then get the direction of that section
3. This is the direction in which the Strength should appear

### Generated Grid
The grid consists of a set of base numbers, an Evil icon and an Age icon.

1. Base numbers (in Chinese)
    - Center number is the Year number
    - Formula is always clockwise

2. Evil icon (Red circle)
    - Found by method explained above and shows in the bottom right corner of the grid item.

3. Age icon (Blue circle)
    - Found by method explained above and shows in the bottom right corner of the grid item.

### How it works
1. `UserInput` specifies `Year`
2. Base numbers are generated from the number that represents the `Year`
3. Find the heaven stem and earth branch pair that represents the `Year`
4. Find where the Evil position is by using the cardinal point of the earth branch
5. Find the number of the Age by using the number of the earth branch
6. Display in `GridView`

### How it looks
<img width="375" src="https://user-images.githubusercontent.com/44921579/200209337-111a6edb-2862-45c0-a51d-8694e678d8ad.png">
