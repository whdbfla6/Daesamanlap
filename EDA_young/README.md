# Daesamanlap

0713 은영

- 공급유형, 자격유형 모두 칼럼당 총세대수로 넣음
- 임대료 임대보증금 단지코드별로 mean 때림
- 지역은 get dummy(drop first)
- 대형전용면적 단지코드별로 sum

#새로운 아이디어: 영구임대에 임대료, 임대보증금에 *2 / 기각됨

<img src="C:\Users\dbdms\AppData\Roaming\Typora\typora-user-images\image-20210715122325129.png" alt="image-20210715122325129"  />   

- 단지내주차면수 <=785의 캣부 결과

<img src="C:\Users\dbdms\AppData\Roaming\Typora\typora-user-images\image-20210715122450099.png" alt="image-20210715122450099"  />  

- 단지내주차면수 > 785의 캣부 결과

이때 mae가 train test split해서 내부에서는 136이었는데 어째서인지 냈을 때는 101이 나왔다...

0715 추가: 

전체 돌렸을때 캣부 114.7

- subway dist 역수 취하고 median 아래(원래 큰 애들) 0으로 만듦. (subway_reverse) 그러나 높아져서 보류
- 상가 빼고 임대료 임대보증금 전용면적 전용면적별 세대수 mean std 넣으니까 결과 좋아짐 (cb 112) / data1은 cb 95, data2는 cb 276. 



0716: 

- 변수 많이 drop(linear regression p-value & catboost feature importance 기준)

- 유림이 EDA(cluster, 연령별 세대수) 넣었음
- data1 cb 87 cb 267로 단지내주차면수 나눈 기준에서 줄었음
- 101인 결과와 mae 36
- 냈을 때는 112....흠

새로운 아이디어: Row 별로 Y 다르게 ==> 너무 크게 예측하는 문제점



