#!/bin/bash
# 텍스트 낱말 빈도 분석

# 명령어줄에서의 입력 파일을 확인

ARGS=1
E_BADARGS=65
E_NOFILE=66

if [ $# -ne $ARGS ] # 필요한 인자가 스크립트로 맞게 넘어왔는지?
then
	echo "사용법: `basename $0` filename"
	exit $E_BADARGS
fi

if [ -f "$1" ]	#파일이 존재하는지 확인.
then
	file_name=$1
else
	echo "\"$1\" 는 없는 파일입니다."
	exit $E_NOFILE
fi

#############################################################
# 메인
sed -e 's/\.//g' -e 's/\,//g' -e 's/ /\
/g' "$1" -e '' | tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr
#			   ==========================
#				발생 빈도

# 점(period)을 걸러내고 낱말 사이의 빈 칸을 라인피드로 바꾼 다음
#+ 모든 문자를 소문자로 변환한 뒤,
#+ 각 낱말의 발생 빈도를 맨 앞에 두고 숫자대로 정렬
#############################################################

# 독자들을 위한 연습문제 :
# 정규식 공부해야할듯 . .. . .
# 1) 'sed' 명령어가 콤마같은 다른 구둣점도 걸러내도록 해 보세요.
# 2) 여러개의 빈 칸과 다른 공백문자도 처리하도록 고쳐보세요.
# 3) 다른 정렬용 키를 추가해서 동일한 발생 빈도를 갖는 낱말에 대해서 
#+ 알파벳 순으로 정렬되도록 해 보세요.

exit 0