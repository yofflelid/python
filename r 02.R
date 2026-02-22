# 44~ 106p 
getwd()
setwd("C:\\Users\\asskj\\Desktop\\r연습")
getwd()

# 날짜형 데이터 
Sys.time()
date1<-as.Date("2018-01-12")
date1

date2<-as.Date("2018-01-01")
date2

#날짜-날짜 연산이 가능하다 
date1-date2

difftime(date1, date2)

# 날짜를 좀 더 편하게 사용하기 위한 패키지 
install.packages("lubridate")
library("lubridate")

# 전통적인(기본적인) 날짜 입력 방법
date1<-as.Date('2021-02-15')
str(date1)

# lubridate() 패키지의 ymd() 함수 사용하기 
date2<-ymd('20210215')
str(date2)



# # 특정 날짜 상세 정보 추출하기 
birth<-ymd('19751023')
b_year<-year(birth)
b_mon<-month(birth)
b_day<-day(birth)

print(b_year)
print(b_mon)
print(b_day)

# week() / wday() 함수 사용하기 
week(birth)

# 요일을 찾아주는 함수 / 일 ~ 토요일을 1~7로 표시한다.
wday(birth)

wday(birth, label=TRUE)



#semester() / quarter() 함수 사용하기 
#semester() - 상반기/하반기 구분하기 
semester(birth)

# 4분기 구분하기 
quarter(birth)

# # 날짜로 연산하기 
# 날짜 연산하기 
# birth 일로 부터 30일이 지난 날짜 구하기 
date3<-birth+30 #또는 days(30)
print(date3)

# birth 일로 부터 3개월이 지난 날짜 구하기 
date4 <- birth + months(3)
print(date4)

# birth 일로 부터 3년이 지난 날짜 구하기 
date5 <- birth + years(3)
print(date5)


library(dplyr)

# 특정 날짜 사이의 기간 구하기 
current_date <-today()
date6 <- current_date - birth
print(date6)  # 두 기간 사이의 총 일수 출력됨 

date7 <- interval(birth, current_date) %>% as.period()
print(date7)

# 기간을 구할때 윤영(2월이 29일 까지인 경우)이 반영이 안되는 특징이 있어서
# 윤년 여부를 확인하는 함수인 leap_year()함수를 사용할 수 있으며
# 만약 윤년일 경우에는 앞에서 사용했던 함수들 이름 앞에 d를 추가해서 활용할 수도 있습니다. 

# # 시간 계산하기 
time1 <-ymd_hms('1975-10-23 22:05:15')
print(time1)

hour(time1)

minute(time1)

second(time1)

am(time1)     #오전 am 오후 pm을 알려주는 함수 

# round_date(), floor_date(), ceiling_date() 
# with_tz() 


# # NA형과 NULL형 데이터(결측치)
nol<-3
nol2<-NA
nol
nol2
nol + nol2 #NA
nol > nol2 #NA

# NA란 Not Applicable, Not Available의 약자로 
# 사용할 수 없는 데이터를 말한다. 

# NA데이터는 산술 연산을 하든
# 비교 연산을 하든 
# 결과는 전부 NA로 나온다.



# NULL은 데이터가 없다는 뜻, 비어있다는 뜻 
# NA와 다르게 NULL과 연산을 하면 
# NULL값을 자동으로 제외시키고 연산을 진행한다. 
sum(1,2,NA)
sum(1,2,NULL)


# NA값이 나올 경우에는 아예 제거를 하고 연산을 하던지 
# 아니면 NA값을 0으로 바꾼 후 연산을 하게 된다. 

# NA와 NULL 처리하기 
x <-NA
y <-NULL
sum(10,20,x,y)
sum(10,20,x,y,na.rm=TRUE)
x[is.na(x)] <-0 #NA값을 0으로 변경하기 
y[is.na(y)] <-0 #NULL값을 0으로 변경하기 
x
y
sum(10,20,x,y)

# # facor 유형 
# 생긴 형태는 벡터형과 비슷한데 
# 범주형 데이터를 분석할 때 많이 사용된다. 
vec1 <-c(1,2,3,4)
str(vec1)
fac1<-factor(c(1,2,3,4))
str(fac1)

# 위에서 vec1은 숫자 num형의 벡터이고 
# fac1은 팩터(factor) 유형이다. 

# 팩터 유형은 주어진 데이터들이 개별 데이터가 아니고 
# 범주(범위)로 취급한다는 것이다. 

# 아래에서 fac1변수에는 1,2,3,4 범위 내의 데이터만 들어올 수 있다. 
# 만약 다른 범위의 값이 들어온다면 
# 아래 그림과 같이 에러가 발생하고 
# NA형을 강제로 입력한다. 
fac1 <-factor(c(1,2,3,4))
# 같은 범주의 데이터를 입력하기
fac1[5] <-3
fac1

# 다른 범주의 데이터를 입력하기 
#fac1[6] <- 6
# 경고메시지(들):
#`[<-.factor`(`*tmp*`, 6, value = 6)에서:
#  요인의 수준(factor level)이 올바르지 않아 NA가 생성되었습니다.

fac1

# 그러나 벡터는 범위로 취급하지 않기 때문에 
# 데이터 유형만 동일하다면 전혀 문제없이 입력될 수 있다. 

# # factor 유형과 산술 연산 
# 데이터가 factor 유형일 경우 
# factor 유형은 숫자 유형이 아니기 때문에 
# 산술 연산을 수행할 경우 에러 발생 
# 반면 벡터 유형은 산술 연산이 아무런 문제 없이 잘 수행된다. 
vec1 <- c(1,2,3,4)
fac1 <- factor(c(1,2,3,4))

# 벡터 유형에 산술 연산 수행하기 
sum(vec1)

# 벡터 유형에 산술 연산 수행하기 
# sum(fac1)
# Summary.factor(1:4, na.rm = FALSE)에서 다음과 같은 에러가 발생했습니다: 
# 요인(factors)에 대하여 의미있는 ‘sum’가 아닙니다.


# # vector 유형과 factor 유형의 상호 변환하기 
# 벡터 유형과 팩터 유형은 비슷한 유형이라서 서로 변환해서 많이 사용한다. 
# 기존 데이터를 factor유형으로  변환할 때는 as.factor() 
# factor 유형을 vector 유형으로 변환해야 할 경우에는 as.numeric() 
str(fac1)
# sum(fac1)
# Summary.factor(1:4, na.rm = FALSE)에서 다음과 같은 에러가 발생했습니다: 
# 요인(factors)에 대하여 의미있는 ‘sum’가 아닙니다.

vec2<-as.numeric(fac1)
str(vec2)

sum(vec2)


# factor에 들어 있는 데이터가 문자형일 경우 
# as.character() 함수를 사용하면 문자형 벡터로 변환할 수 있다. 
# 나중에 ~ 엑셀이나 csv 형식의 파일을 불러올 경우 
# 특정 칼럼들을 자동으로 factor유형으로 불러오는 경우가 있다. 
# 강제로 factor유형을 사용하지 못하게 지정하는 옵션이 
# stringAsFactors = FALSE 




# # # 대량 데이터 관리 기법들 

# # 벡터 vector 

var1 <-1
var1 <-2
var1 <-3
var1 # 변수는 기본적으로 1개의 값만 담을 수 있다. 

# 1개의 변수에 1,2,3을 한꺼번에 다 담고 싶을 경우는, 
# 벡터를 사용한다. 

# c() 여러 벡터들을 붙여주는 concatenate 
var1 <- c(1,2,3)
var1

is.vector(var1)


# 반드시 데이터 유형이 같은 것들만 들어가야 한다. 
class(var1) # "numeric"
var2<-c(1,2,'3')
class(var2) # "character"

# # 벡터 데이터 조회하기 
var3 <-c('새우깡', '감자깡', '고구마깡', '맛동산','짱구')

# 특정 데이터 호출 방법 : 벡터이름[행번호]
var3[2]
var3[-2] # 특정 행만 빼고 조회하기 
var3[2:4] # 범위 주고 조회하기 
var3[-2:-4]

var5 <-c(1,3,5,7,9)
3 %in% var5
5 %in% var5

Fruit <-c("사과", "단감", "귤","파인애플", "apple")
"감" %in% Fruit
"p" %in% Fruit

# 벡터에서 특정 데이터가 존재하는 위치값을 찾는 방법 
which(Fruit == "단감")
which(Fruit == "apple")
which(Fruit == "망고")



# # 벡터 데이터 연산하기 
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec1 + vec2
vec3 <- c(1,2,3,4)
vec1 + vec3
# 경고메시지(들):
#vec1 + vec3에서: 두 객체의 길이가 서로 배수관계에 있지 않습니다

length(vec1)
length(vec3)

# 벡터에 숫자가 들어가 있을 경우 산술 연산이 가능 
# 단 벡터의 길이가 같아야 하고 
# 길이가 다를 경우 에러 발생 
# 벡터의 길이를 확인하는 명령어가 lenght(벡터이름) ~ 기억하기 

vec1
vec2
vec3

union(vec1,vec2)
setdiff(vec3,vec1)
intersect(vec2,vec3)
# union()함수는 여러 벡터의 내용을 합치는 기능이고 
# setdiff(벡터1, 벡터2) 는 벡터1에 있는데 
# 벡터2 에 없는 것을 찾는 것이고 
# intersect(벡터1,벡터2)는 교집합을 찾는 것이다. 

# 연습 문제 
# 1) 
drink <- c("콜라", "사이다","환타","핫식스","몬스터")
drink

#2) 
drink
drink[2:5]
drink[-1 -2]
drink[c(2, 3, 5)]
drink[-c(1,4)]
drink[drink %in% c("사이다","환타","몬스터")]
#3) 
vec1 <-c("홍길동", "강감찬", "김유신")
vec2 <-c("송강호", "나문희")
union(vec1, vec2)

#4) 
vec1 <- c( "홍길동", "강감찬", "김유신")
length(vec1)



# # 행렬 Matrix 
mat1 <- matrix(c(1,2,3,4))
mat1


mat2 <- matrix(c(1,2,3,4), nrow=2) # nrow = 행의 갯수 
mat2

mat2 <- matrix(c(1,2,3,4), ncol=2) # ncol= 열의 갯수
mat2




mat2 <- matrix(c(1,2,3,4), nrow=2) # nrow = 행의 갯수 
mat2
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=TRUE) 
mat3
# byrow 옵션을 사용하기 전에는 데이터가 세로로 먼저 세워졌는데 
# byrow 옵션을 사용하니까 가로로 먼저 채워진다. 


# # matrix 조회하기 
mat4 <- matrix(c(1:20), nrow=4)
mat4

mat4[c(1,3), c(2,3)]
mat4[, c(2,3)] #행 위치 빈칸이면 모든 행이라는 뜻이다. 

mat4[c(1,3) , ] #열 위치 빈칸이면 모든 열이라는 뜻이다. 


# # 연습문제 
# 1) 
fruit <- matrix(c("감자", "당근", "고구마", "양파"), nrow=2)
fruit

# 2)
mat <- matrix(c(1:20), nrow=4)
mat
mat[c(1,3), c(1,2,4)]



# # 배열 array 
array1 <- array(c(1:12), dim=c(2,2,3)) # dim=c(가로,세로,높이)
array1

# # array 조회하기 
array1
array1 [1,1,1]
array1 [1,1,2]
array1 [1,2,2]

# # 리스트 list
list1 <- list(학번 = 1001, 이름='홍길동', 생일='1980-07-15')
list1

list2 <- list( 컴퓨터공학과 = c('홍길동', '전우치', '일지매'),
               전자공학과 = c('강감찬', '이순신', '을지문덕'),
               국문학과 = c('신사임당', '유관순', '김구'))
list2

# # list 유형 조회하기 
list2 <-list(STUDNO=1001, NAME='홍길동', BIRTH='1980-07-15')
list2
list2$STUDNO
list2$NAME
list2$birth
list2[3]


# # 연습문제 
# 1) 
구매내역목록 <- list(번호=c(1000), 
               고객명=c('홍길동'), 
               상품명=c('맛동산'),
               구매일자=c('2018-01-11'),
               금액=c(500))
구매내역목록

# 2) 
구매내역목록$고객명
구매내역목록[c(1,2,5)]

# # 데이터 프레임 형 Date Frame
# 앞에서 살펴본 list형은 다양한 유형의 데이터를 세트로 만들어서 
# 저장할 수 있는 장점이 있는 반면에 
# 1 건만 저장할 수 있다는 단점이 있다. 

# 데이터를 여러 건을 저장해야 할 경우가 대부분인데, 
# 이럴 경우에 사용하는 유형이 date frame 

studno <-c(1001,1002,1003)
name <-c("홍길동", "일지매", "전우치")
birth <-c("1980-07-15", "1985-10-23","1983-05-05")
member<-data.frame(STUDNO=studno, NAME=name, BIRTH=birth)
member
member$STUDNO
member$NAME
member$birth
member$BIRTH
# 데이터프레임$라벨명 형태로 조회하면 된다. 
# 라벨명도 대소문자를 정확하게 구분한다. 
# 라벨명으로도 조회 가능하지만
# matrix의 데이터를 조회하는 방법으로도 가능하다. 

member 
member[c(1,3), c(1,2)]

studno <-c(1001,1002,1003)
name<-c("홍길동", "일지매", "전우치")
birth <-c("1980-07-15", "1985-10-23","1983-05-05")
member <-data.frame(학번=studno, 이름=name, 생일=birth)
member

which(member$이름=="일지매")
member[2,]



# # data frame 합치기 - merge 
# 예제로 사용할 데이터 프레임 2개를 만듦. 
d1 <- data.frame(name=c("홍길동", "일지매", "전우치"), 
                 height=c(180, 175, 182))
d2 <- data.frame(name=c("홍길동", "강감찬", "전우치"), 
                 weight=c(82, 75, 90))
d1
d2


# 이제 merge작업 
merge(d1, d2) # d1을 기준으로 d2와 공통적으로 가진 데이터만 출력
merge(d1,d2,all=T) #d1을 기준으로 d2와 모든 데이터 출력

# d1, d2 데이터 프레임에 grade 컬럼을 추가한 후 
# merge 작업 진행 
d1$grade <-c(1,2,3)
d2$grade <-c(1,3,3)
d1

d2

merge(d1,d2,key="grade")
merge(d1,d2,key="grade", all=T)

# 위 그림에서 key 옵션 대신에 
# 아래 그림 처럼 by='기준컬럼' 옵션을 사용해도 된다. 
merge(d1,d2,by="grade", all=T)

# # 새로운 행과 열 추가하기 
# rbind() / cbind() 
hang <- data.frame( STUDNO =1004, 
                    NAME = "강감찬", 
                    BIRTH = '2001-05-25')
member <-rbind(member, hang)
member




hang <- data.frame(
  학번 = 1004,
  이름 = "강감찬",
  생일 = "2001-05-25"
)


colnames(member)
colnames(hang)

member <- rbind(member, hang)
member


d1<-data.frame(name=c("홍길동", "일지매", "전우치"),
               height=c(180, 175, 182))
d2<-data.frame(name=c("을지문덕", "강감찬", "전우치"),
               height=c(182,175,190))
d1
d2
rbind(d1,d2)

member <-cbind(member, data.frame(grade=c(1,2,3,4)))
member

d1
d2
cbind(d1,d2)

d1
d2
cbind(d1,d2)
merge(d1,d2,all=T)

##############
member
member$지역 <-c("서울", "부산", "대전")
member


nrow(member)

d1
d2
cbind(d1,d2)
merge(d1,d2,all=T)


member

member$지역 <-c("서울", "부산","대전")
member

member<-transform(member, 나이=c(31,32,33), 
                  취미=c('등산', '마라톤', '마술'))
member

d3 <-d3[-4]
d4

d5<-subset(d4, select=-(grade))
d5

# #데이터 프레임의 데이터 유형 확인하기 str() 
str(d3)



# # 연습문제 
# 1) 
구매정보테이블 
  
  
# 2) 
구매정보테이블[]

# 3)

구매정보테이블 


# # # 다양한 형식의 데이터 불러오기와 저장하기 
setwd("C:\\Users\\asskj\\Desktop\\부트캠프\\R\\R실습용파일모음")
list.files()
txt1<-readLines("구매후기.txt")
txt1

txt1 <- readLines("구매후기_utf8.txt", encoding="UTF-8")
txt1


# # 정형 데이터 불러오기 
# read.table() 

txt4 <-read.table("전공_utf8.txt")
txt4

txt4<-read.table("전공_utf8.txt", fileEncoding="UTF-8")
txt4

txt5<-read.table("전공_utf8.txt", header=TRUE)
txt5

txt6 <-read.table("전공2_utf8.txt", header=TRUE, sep=":")
txt6

# # read.csv() 
txt7 <-read.csv("전공3_utf8.txt")
txt7


txt7 <-read.csv("전공3_utf8.txt", fileEncoding="UTF-8")
txt7

# # readxl() excel형식의 파일 불러오기 
install.packages("readxl")
library("readxl")
txt8 <-read_excel("C:\\Users\\asskj\\Desktop\\부트캠프\\R\\R실습용파일모음\\전공4.xls", sheet=1)
txt8

txt8 <-read_excel("C:\\Users\\asskj\\Desktop\\부트캠프\\R\\R실습용파일모음\\전공4.xls", sheet="2학기")
txt8


# # 사용자로 부터 데이터 입력 받기 

# scan() 함수 사용하기 - 숫자나 단어 입력 받기 
nol <- scan()
1
2
nol

txt10 <-scan()
#홍길동 일지매
txt10 <-scan(what='')
#홍길동 일지매 # 공백기준으로 분리해서 자동으로 2단어로 인식 
#강감찬

txt10



# readline() - 문장 입력 받기 
txt11 <-readline()
#R이 좋아요~
txt11



txt12 <- readline( '뭐가 좋아요? : ')
#R이 좋아요 
txt12


# pdf 파일의 내용 읽어오기 
install.packages("pdftools")
library("pdftools")


list.files()
list.files(pattern="pdf$")

txt13<-pdf_text("pdf_ex1.pdf")
cat(txt13[1])


list.files(pattern="^pdf_ex")
all_files<-list.files(pattern="^pdf_ex")
all_pdf<-lapply(all_files, pdf_text)
all_pdf

# spss와 sas 파일 불러오기 

# spss파일 형식 불러오기 
# sas 파일 불러오기 
# haven 패키지 활용하기 
# Oracle DB의 테이블 정보 불러오기 


# 다양한 유형으로 저장하기 
# write() / writeLines() 비정형 형태로 저장하기 


# write.table() 공백으로 구분된 테이블 형태로 저장하기 
setwd("C:\\Users\\asskj\\Desktop\\부트캠프\\R\\R실습용파일모음")
txt14 <-read.table("전공_utf8.txt", header=T)
txt14
# write(txt14, "txt14_utf8.txt")
write.table(txt14, "txt14_utf8.txt")


# write.csv / csv형태로 저장하기 
txt14

write.csv(txt14, 'txt14.csv')

# 엑셀 xls, xlsx 형식으로 저장하기 

install.packages("xlsx")
library("xlsx")

txt14
write.xlsx(txt14, "txt14.xls")

txt14
write.xlsx(txt14,'txt14.xlsx')


install.packages("foreign")
library("foreign")

write.foreign(txt14, datafile="sas_01.txt", codefile="sas_01.sas",package="SAS")
colnames(txt14)

colnames(txt14) <- c("id", "name", "major")

write.foreign(txt14,
              datafile="sas_01.txt",
              codefile="sas_01.sas",
              package="SAS")






write.foreign(txt14, datafile="spss_01.txt", codefile="spss_01.sas",package="SPSS")



x <-c(1,2,3,4,5)
plot(x)
savePlot("x.png", type="png")




png("x.png")   # 파일 열기
plot(x)        # 그래프 그리기
dev.off()      # 파일 닫기














