# Daesamanlap

# 0718
## 은영이파일 *0718_갱신.ipynb*
### 1. 변수목록
- 상가비율
- 세대당가능주차면수
- 공가수비율
- 대형전용면적 더미

- 자격유형 카테고리 {'1': 'A' ,'2':['C','F','G'],'3':['B','H','I'],'4':['J'], '5':['L',"M","N","O"],'6':["E","K"],'7':'D'}
- 공급유형별로 전용면적별세대수 sum 넣기 
- 임대료/임대보증금 평균 (상가빼고 평균 넣었을 때 mae 1이 안좋아진다)
- 연면적 (연면적 빼고 하면 mae 가 0.2 올라간다)

- 그 외 변수: 위도, 경도, subway_dist, 환승역 수, 총인구수, 세대당_인구, 남/여비율, 남/여_0~19세, 남/여_20~39세, 남/여_40~69세, 남/여_70세이상, 0~19세_비율, 20~39세_비율, 40~69세_비율, 70세이상_비율, 
         


### 2. 모형 나눈 기준: 단지내주차면수 785 기준으로 나누어 catboost
### 3. split test mae: catboost (96, 288)


### * 우리가 해볼 수 있는 것
- 모형 나누는 기준을 바꿔보자: 세대당가능주차면수, 세대당 인구 
- 전용면적, 전용면적별세대수 
- subway distance 바꾸기
- 총세대수/법정동세대수 후보 ... 
- 


## 유림이 세대당_인구 로 데이터 나누기 
- 세대당 인구로 분포가 날려서 2.4 기준으로 나누니까 2.4보다 낮은 그룹에서 너무 낮게 예측한다. 
- 

* 새로운 변수 찾거나,, 세대당주차면수 나누면 큰쪽이 문제였다.. 찾다... 


# 0719 stepwise
* 새로 해볼 것들
1. 자격유형 빼기 -> 제출 99.5240638276 
2. **1.** 상태에서 지역 빼고 유민이의 지역 카테고리로 넣기 <br>
-> group1 = ['대구광역시','세종특별자치시','경기도','서울특별시','충청북도','전라남도','전라북도','경상북도'] <br>
-> group2 = ['대전광역시','울산광역시','광주광역시','경상남도','제주특별자치도','부산광역시','충청남도','강원도'] <br>
-> 제출 104.0779652356 (5 올라감)

3. 세대당주차면수(0.83) 기준으로 나누기 -> 110.0922388926(11 올라감)
4. 임대료, 임대보증금 std 넣어서 -> 102 (3 올라감)
5. 장기전세만 빼기 -> 102.61 (3 올라감)
6. 공급유형에 임대료/임대보증금 비율들의 평균 넣기 -> 105.4136514162 (6올라감)
7. 전용면적 평균 넣기 -> 102.3697214742 (3 올라감)


### ^^* 오늘 정리 
- **단지내주차면수-총세대수** 뺀 변수 넣어보기 (EDA해보고)
- 두 그룹의 변수 다르게 하기 <br>
         - 주차면수 낮은 그룹에서 변수를 좀더 빼보자 
- drop해볼 변수: 남/여 비율, 환승역 수
- subway_dist와 환승역 수 보정 (역수해서 작은애들 0)
- 지하상가만 빼기 
- 전용면적 std 넣기 (지하상가 유무)
- 대형전용면적 sum 이 아닌 dummy로
- data.단지내주차면수<876 로 데이터 땡기기 


# 0720
1. data.단지내주차면수 < **987** 땡겼을 때 -> 제출: 98.00418
- 784 기준: (95* 310+ 221* 104)/414 = 126.652
- 876 기준: (97* 330 + 275* 84)/414 = 133.1159
- 987 기준: (105* 362 + 290* 52 ) /414 = 128.2367

2.*단지내주차면수-총세대수* (made by 유민 called 잉여주차)
-> 일단 1에 제출(98.00418)한 결과랑 비교했을 때 mae 차이가 2.75여서 제출은 아직 안함.

3. 
