{
	programs.tmux = {
		enable = true;
		extraConfig = "
#mouse
		set -g mouse on
#window
		bind n new-window
#panel
		bind j split-window
		bind h split-window -h
		bind -n C-j select-pane -D  # Переключение вниз
		bind -n C-k select-pane -U  # Переключение вверх
		bind -n C-h select-pane -L  # Переключение влево
		bind -n C-l select-pane -R  # Переключение вправо
#previous command
		bind -n C-p send-keys -t . Up Enter
#exit
        bind -n C-r kill-pane
		bind q kill-session
		";
	};
}
