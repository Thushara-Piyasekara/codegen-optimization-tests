set expectedJsonPath=%1
set actualJsonCache=%2
set actualJsonPath=%actualJsonCache%\%~nx1


fc /a /n %expectedJsonPath% %actualJsonPath%