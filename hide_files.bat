@echo off
call :setWindowProperty
call :createFolder
goto :main
     :setWindowProperty
	title File/Folder Concealer
	  mode con: cols=65 lines=22
	    color 0a

goto :eof
     :createFolder
	set messageCode=welcome
	set creditsURL="http://pastebin.com/38x5fDTb"
	set feedbackURL="http://goo.gl/eCBNNE"
	set setupPath="C:\Users\%username%\Desktop\FFC"
	set hidepicturePath="C:\Users\%username\Desktop\FFC\hidden_picture"
	  if not exist %setupPath% (
	    cd "C:\Users\%username%\Desktop"
		mkdir FCC
	    cd %setupPath%
		echo. >> log.txt
	  ) else if not exist %hidepicturePath% (
	    cd %setupPath%
		mkdir hidden_picture
	  ) else (
	    goto :eof
	  )
goto :eof
     :main
	cls
	if "%messageCode%"=="welcome" (
	  call :welcomeMessage
	) else if "%messageCode%"=="pathnotfounderror" (
	  call :pathnotfounderror
	) else if "%messageCode%"=="success" (
	  call :success
	) else if "%messageCode%"=="error" (
	  call :error
	) else if "%messageCode%"=="contact" (
	  call :contact
	) else if "%messageCode%"=="hidepictureSuccess" (
	  call :hidepictureSuccess
	) else if "%messageCode%"=="hidepictureFail" (
	  call :hidepictureFail
	) else (
	  call :error
	)
	echo [1] Hide
	echo [2] Reveal
	echo [3] Hide a file inside a picture
	echo [4] Log History
	echo [5] Credits
	echo [6] Give Feedback
	echo [7] Contact
	echo [8] Exit
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.
	set /p option="What would you like to do?: "
	  call :operation %option%

goto :main
     :welcomeMessage
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo e                         Welcome to                           e
	echo s                             FCC                              s
	echo h                                                              h
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.

goto :eof
     :error
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo e                      Incorrect Choice!                       e
	echo s                         Try again.                           s
	echo h                                                              h 
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.

goto :eof
     :success
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo e                          Success!                            e
	echo s                     Operation Complete.                      s
	echo h                                                              h
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.

goto :eof
     :pathnotfounderror
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo e                  That file doesn't exist?                    e
	echo s                         Try again.                           s
	echo h                                                              h
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.
goto :eof
     :hidepictureSuccess
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo e                     Files hidden inside                      e
	echo s                 target picture successfully.                 s
	echo h                                                              h
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.

goto :eof
     :hidepictureFail
	cls
	echo.
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo h                                                              h
	echo h               Files failed to be hidden inside               h
	echo h                 target picture successfully.                 h
	echo h                                                              h
	echo h       * Did you make sure the extension was correct?         h
	echo h       * Did you check to make sure BOTH files are inside     h
	echo h         the FFC folder?                                      h
	echo h       * Perhaps the compressed file is a different format?   h
	echo h                                                              h
	echo h                                                              h
	echo hesheshesheshesheshesheshesheshesheshesheshesheshesheshesheshesh
	echo.

goto :eof
     :feedback
	if exist "C:\Program Files (x86)\Google\Application\chrome.exe" (
	  start chrome.exe "%feedbackURL%"
	) else if exist "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" (
	  start firefox.exe "%feedbackURL%"
	) else (
	  start iexplore "%feedbackURL%"
	)

goto :eof
     :credits
	if exist "C:\Program Files (x86)\Google\Application\chrome.exe" (
	  start chrome.exe "%creditsURL%"
	) else if exist "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" (
	  start firefox.exe "%creditsURL%"
	) else (
	  start iexplore "%creditsURL%"
	)

goto :eof
     :contact
	cls 
	echo heshergrapturegmail.com

goto :eof
     :exit
	exit

     :operation
	if %~1==1 (
	  call :hide
	) else if %~1==2 (
	  call :reveal
	) else if %~1==3 (
	  call :hidepicture
	) else if %~1==4 (
	  call :log
	) else if %~1==5 (
	  call :credits
	) else if %~1==6 (
	  call :feedback
	) else if %~1==7 (
	  call :contact
	) else if %~1==8 (
	  call :exit
	) else (
	  set messageCode=error
	  sleep 5
	)

goto :eof
     :hide
	cls
	set /p folderpath="Enter the PATH of the File/Folder you want to hide: "
	  if exist "%folderpath%" (
	    attrib +H "%folderpath%"
	      cd %setupPath% 
	        echo Operation: Hide     ^Date^&Time : %date% %time%    FolderPath: "%folderpath%" >> log.txt
	    set messageCode=success
	    sleep 5
	  ) else (
	    set messageCode=pathnotfounderror
	  )

goto :eof
     :reveal
	cls
	set /p folderpath = "Enter the PATH of the File/Folder you want to reveal: "
	  if exist "%folderpath%" (
	    attrib -H "%folderpath%"
	      cd %setupPath% 
	        echo Operation: Reveal --- ^Date^&Time : %date% %time%    FolderPath: "%folderpath%" >> log.txt
	    set messageCode=success
	    sleep 5
	  ) else (
	    set messageCode=pathnotfounderror
	    sleep 5
	  )

goto :eof
     :log
	cd %setupPath%
	  start log.txt
	set messageCode=success
	sleep 5

goto :eof
     :hidepicture
     :home
	cls
	type="DONOTDELETE.txt"
	echo.
	  cls
	  echo What is the name of the picture you will use? (Please include the current extension e.g. .jpg)
	  set /p folderpath=">>"
	    echo.
	    echo What is the name of the compressed file? (Please include the current extension e.g. .zip, .rar)
	    set /p zip=">>"
	    echo.
	      echo What do you want the new file to be called? (Please include the new extension e.g. .mp3, .vbs)
	      set /p nname=">>"
	      echo.
		cd %hidepicturePath%
		copy /b %folderpath% + %zip% %nname%
		cls
		if exist %folderpath% (
		  cd %setupPath%
		  move /y %nname% hidden_picture
		  echo Operation: Hide Picture --- ^Date^&Time : %date% %time%    FolderPath: "%folderpath%" >> log.txt
		  set messageCode=hidepictureSuccess
		) else (
		set messageCode=hidepictureFail
		)

goto :eof
