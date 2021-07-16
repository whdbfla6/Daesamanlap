### modeling 1: 122/59

1. 공가수비율: 공가수/총세대수
2. 세대당 가능주차면수: 단지내주차면수/총세대수 
3. 인구 파생변수 : 인구비율(법정동) * 총세대수
4. 공급유형: 공급유형 클러스터링 dummy variable
5. 지하철역 거리: 4개의 그룹으로 나눈 후에 dummy variable
6. 아파트 임대료/임대보증금: quantile
7. 상가 임대료/임대보증금 : mean std
8. 아파트 전용면적 : quantile
9. 상가 전용면적 : mean std
10. 총세대수/ 단지내 주차면수 제거 



### modeling 2 : 119/56

1. 상가 임대료/임대보증금: quantile

### modeling 3 : 115/62/118(제출)

1. 상가 임대료/임대보증금: quantile
2. 공급유형: 공급유형 클러스터링 후에 평균 임대료 포함

### modeling 4 : 115/59

1. store 임대료: mean std count(범위 클러스터)
2. 공급유형: 평균 임대보증금/ 평균 임대료 


### modeling 5 : 121/60

1. store 임대료: quantile count(범위 클러스터)
2. 공급유형: 평균 임대보증금/ 평균 임대료 

### modeling 6 : 114/54/115(제출)

1. modeling 4 유지
2. 단지내주차면수 포함 + 관련 파생변수 제거 

### modeling 6(파라미터 튜닝) - parameter tuning : 111/58

```{'max_depth': 4, 'n_estimators': 400}```

- 의미있는 변수: 세대당 가능주차면수/인구 파생변수/ 공급유형: 평균 임대보증금/ 평균 임대료 추가

- cat_features사용할 경우 오히려 성능이 떨어짐
- 제출한 것과 train/test split에서 계산한 mae가 유사한 값을 가짐
