eunit.vim
---------

This is a lightweight eunit runner for Vim. Heavily inspired by the [rspec.vim](https://github.com/thoughtbot/vim-rspec) test runner

Configuration
-------------

Place the following mappings in `.vimrc` file.

	" eunit.vim mappings
	map <Leader>t :call EunitCurrentFile()<CR>
	map <Leader>s :call EunitNearestTest()<CR>
	map <Leader>l :call EunitLastCommand()<CR>
	map <Leader>a :call EunitTestAll()<CR>
	
Custom Commands
---------------

You can define your own custom command. For example, integrating eunit.vim with tslime.vim you could set the following:

`let g:eunit_command = 'call Send_to_Tmux("rebar eunit suites={suites} tests={tests}\n")'`