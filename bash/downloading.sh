folder=""
declare -A urls=()

while getopts ":f:u:n:h" opt; do
    case $opt in
        h)
            echo ""
            echo "----------- created by nguyenlm ---------------"
            echo ""
            echo "Usage: Download multifiles into one folder"
            echo ""
            echo "Arguments:"
            echo "-h --help                    shows guideline and exits"
            echo "-f --folder                  the folder where we'll download into (default is current directory)"
            echo "-u --url                     the specified url needed to download"
            echo "-n --name                    the name of previous url saved in my computer"
            exit 1
            ;;
        f)
            if [ ! -z "$folder" ]; then
                echo "only allow one folder"
                exit 1
            fi
            folder=$OPTARG
            ;;
        u)
            urls[$OPTARG]=""
            ;;
        n)
            prev_argument_index=`expr $OPTIND - 3`
            prev_url=${!prev_argument_index}
            urls[$prev_url]=$OPTARG
            ;;
        \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac
done

if [ ! -z "$folder" ]; then
    mkdir $folder
else
    folder=$CWD
fi

for url in "${!urls[@]}";do
    echo "downloading the file \"$url\" into the folder \"$folder\""

    filename=${urls[$url]}
    if [ -z "$filename" ]; then
        wget -P $folder $url
    else
        cd $folder
        wget -O $filename $url
    fi

done