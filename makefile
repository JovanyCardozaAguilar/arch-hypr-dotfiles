sync:
	cp -r ~/.config/hypr ./
	cp -r ~/.config/waybar ./
	git add .
	git commit -m "updated configs"
	git push

install:
	git fetch
	git pull
	cp -r ./hypr ~/.config/
	cp -r ./waybar ~/.config/
	pkill waybar; nohup waybar &
	hyprctl reload
