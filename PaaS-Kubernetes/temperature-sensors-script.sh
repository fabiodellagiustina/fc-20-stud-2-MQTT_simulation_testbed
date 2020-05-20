id=$(shuf -i 1000-9999 -n 1)
topic="temp"
while true
do
  timestamp=$(date "+%Y/%m/%d %H:%M:%S")
  temperature=$(shuf -i 0-100 -n 1)
  message="$timestamp Device:$id Temperature:$temperature°C"
  pub -h 172.24.4.101 -t "$topic" -m "$message"
	sleep $(shuf -i 3-5 -n 1)
done
