## ProcessedData: 모델링 전 대회에서 제공한 데이터와 외부데이터를 합치는 과정
1. [train_processed.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/subway.csv), [test_processed.csv](https://github.com/whdbfla6/Daesamanlap/blob/fe93fc199b1d9564f0db5b962805a2e4eb117fb5/ProcessedData/test_processed.csv)
- `임대료`, `임대보증금` 등 NA 채운값 
- NA 처리 과정은 [ProcessedData/External](https://github.com/whdbfla6/Daesamanlap/blob/cbfeadb34308bff2368bdd431a40d30ce2ac2a3c/ProcessedData/External/readme.md) 폴더 참고 

2. [building_tr.csv](https://github.com/whdbfla6/Daesamanlap/blob/d6e96a0d8c1fe49c5fff5e91823ff53fe3438f36/ProcessedData/building_tr.csv), [building_tst.csv](https://github.com/whdbfla6/Daesamanlap/blob/d6e96a0d8c1fe49c5fff5e91823ff53fe3438f36/ProcessedData/building_tst.csv)
- 건축연면적 크롤링 데이터 (도로명주소, 지번주소, 위도, 경도, 건축물대장 확인 가능)
- 법정동별 인구정보를 가져오는데 필요한 도로명주소 사용
- 최종 데이터에서는 연면적 데이터만 사용 (후에 잘못된 연면적이 있는 것으로 판단되어 KNN을 이용해 일부 값 수정)

3. [train_apt.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/train_apt.csv), [test_apt.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/test_apt.csv)


4. [trans_address_tr.txt](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/trans_address_tr.txt), [trans_address_tst.txt](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/trans_address_tst.txt)


5. [pop_tr.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/pop_tr.csv), [pop_tst.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/pop_tst.csv)
- 법정동별 연령별 인구수 및 세대수 (출처: [통계청](https://kostat.go.kr/portal/korea/index.action))
- 법정동행정동코드 매핑 데이터 (출처: [행정안전부](https://www.mois.go.kr/frt/bbs/type001/commonSelectBoardArticle.do;jsessionid=+ZUzK-vRbyaKqumcJq8NrYJf.node50?bbsId=BBSMSTR_000000000052&nttId=85215) )

6. [subway.csv](https://github.com/whdbfla6/Daesamanlap/blob/a25c6ba78220d67d33e76ae26a34ece1619ad4cd/ProcessedData/subway.csv)


7. [merged_train.csv](https://github.com/whdbfla6/Daesamanlap/blob/fe93fc199b1d9564f0db5b962805a2e4eb117fb5/ProcessedData/merged_train.csv), [merged_test.csv](https://github.com/whdbfla6/Daesamanlap/blob/fe93fc199b1d9564f0db5b962805a2e4eb117fb5/ProcessedData/merged_test.csv)


## 총 데이터 merge 과정: [DataMerge.ipynb](https://github.com/whdbfla6/Daesamanlap/blob/e40a664000410e00550f1ee5dbb9b55080b6deec/ProcessedData/External/DataMerge.ipynb)
