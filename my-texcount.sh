#!/bin/bash
# 使用latex自带的texcount程序来统计文章字符数，运行方法是 sh my-texcount.sh
# 在windows上，可以使用git Bash运行shell脚本

# 排除计数的文件：excludeFile
excludeFile=("acknowledgements.tex" "appendix.tex" "cnabstract.tex" "copyright.tex" \
	"cover.tex" "enabstract.tex" "publications.tex")

totalStr=" "

# 遍历./data中的文件

for file in ./data/*
do 
	if [[ "${file##*.}" == "tex" ]]; then # 判断文件后缀名是否是tex
		flag=0
		
		# 判断当前文件是否存在与excludeFile中
		for excfile in ${excludeFile[@]}
		do
			if [[ $file == "./data/${excfile}" ]]; then
				flag=1
				break
			fi
		done
		
		# 如果不是excludeFile中的文件，则加入totalStr中
		if [[ $flag == 0 ]]; then
			totalStr="${totalStr} ${file}"
		fi
	fi
done

# 使用texcount统计这些文件中的字符
texcount $totalStr

