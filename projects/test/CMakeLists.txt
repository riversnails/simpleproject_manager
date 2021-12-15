SET(SOURCE ./source/)
	SET(TARGET ${SOURCE}custom_math.c ${SOURCE}main.c )
	INCLUDE_DIRECTORIES(include)
	ADD_EXECUTABLE(app.out ${TARGET})
