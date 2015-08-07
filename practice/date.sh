#!/bin/bash

# 'date' 명령어 연습

content="올해가 시작한 뒤로 지금까지 `date +%j` 일이 지났습니다."
echo $content
# 날짜는 형식화 하려면 포매터 앞에 '+'를 써야 합니다.
# %j 는 오늘이 연중 몇 번째 날인가를 알려줍니다.

prefix=temp
suffix=`eval date +%s` # 'date'의 +%s" 옵션은 GNU 전용 옵션입니다.
filename=$prefix.$suffix
echo $content > $filename.dat
exit 0
