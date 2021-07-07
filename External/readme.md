## 1. 데이터

### 1) external_data.csv

- 아파트 정보 포함

### 2) result.csv

- 단지코드(train기준), 단지명(외부데이터 기준)

### 3) store.csv

- 상가 임대료 임대보증금 na imputation된 파일(linear regression 적용 전)

### 4) trainsample.csv/ testsample.csv

- linear regression 적용해서 NA imputation



## 2. DataMerge.ipynb

### 1. train data, 외부 데이터 merge

- 기준1 : 지역, 공급유형, 총세대수
- 기준 2 : 지역, 공급유형, 전용면적, 임대보증금
- 기준 3 : 지역, 공급유형, 전용면적, 단지내주차면수

3가지 기준으로 외부데이터와 기존 train data를 merge하였다. 

### 2. Merge 결과

#### 1) NA

- 최종 NA는 5개 ```['C1899', 'C2245', 'C1584', 'C1156', 'C2020']```
- 기준에 따라 여러개의 단지명을 갖는 경우: 60개

#### 2) 주소특정 필요한 단지코드

```
['C1022' 'C1039' 'C1068' 'C1085' 'C1109' 'C1175' 'C1206' 'C1207' 'C1234'
 'C1258' 'C1269' 'C1307' 'C1341' 'C1344' 'C1439' 'C1451' 'C1601' 'C1616'
 'C1681' 'C1732' 'C1740' 'C1744' 'C1790' 'C1859' 'C1874' 'C1875' 'C1894'
 'C1965' 'C1970' 'C2034' 'C2038' 'C2070' 'C2082' 'C2085' 'C2109' 'C2127'
 'C2132' 'C2133' 'C2135' 'C2173' 'C2186' 'C2190' 'C2227' 'C2232' 'C2258'
 'C2289' 'C2310' 'C2325' 'C2352' 'C2378' 'C2393' 'C2416' 'C2453' 'C2530'
 'C2563' 'C2597' 'C2621' 'C2627' 'C2635' 'C2657']
```

- 상가가있는 아파트부터 수작업으로 비교해가며 NA값을 채워줌
- 현재 result.csv파일로 저장되어 있음 

  

## 3. Store_info.ipynb

- 임대료, 임대보증금 na imputation [NH청약센터](https://apply.lh.or.kr/LH/index.html?gv_url=SIL::CLCC_SIL_0080.xfdl&gv_menuId=1010205&gv_param=CCR_CNNT_SYS_DS_CD:04,PAN_ID:BN-0000819,LCC:Y#SIL::CLCC_SIL_0030:1010205)
- 단지코드 동일한 row의 임대료, 임대보증금 이용해서 linear regression
- 지하에 있는 상가는 제외 $\rightarrow$ 일단 0으로 둠

