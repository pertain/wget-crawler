# wget_crawler.sh
#
# This script is used to collect the first 100 links that wget finds
# with a seed url of: computerscience.pages.tcnj.edu


# This part grabs all pdf/html files
wget -nv -r -o urlLog.txt -l 0 -t 1 \
    --spider -w5 -A=*.{pdf,html} -e \
    robots=on "computerscience.pages.tcnj.edu"


# This part extracts the links from the log file & populates a txt file with them
grep -Po '"\K[^"\047]+(?=["\047])' urlLog.txt | \
    head -n100 | \
    awk -F: '{print "http://"$1}' > urls.txt
