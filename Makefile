CC=g++
CFLAGS=-std=c++11 -Wall
TARGET=program

BUILD_DIR    = ./build
SRC_DIR    = ./src
ENTIDADES_DIR    = ./src/entidades
INCLUDE_DIR  = ./include

${BUILD_DIR}/${TARGET}: ${BUILD_DIR}/Apartamento.o ${BUILD_DIR}/Casa.o ${BUILD_DIR}/Cliente.o ${BUILD_DIR}/Cobertura.o ${BUILD_DIR}/Imovel.o ${BUILD_DIR}/main.o
	${CC} ${CFLAGS} -o ${TARGET} ${BUILD_DIR}/*.o
	
${BUILD_DIR}/Apartamento.o: ${INCLUDE_DIR}/Apartamento.hpp ${ENTIDADES_DIR}/Apartamento.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${ENTIDADES_DIR}/Apartamento.cpp -o ${BUILD_DIR}/Apartamento.o

${BUILD_DIR}/Casa.o: ${INCLUDE_DIR}/Casa.hpp ${ENTIDADES_DIR}/Casa.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${ENTIDADES_DIR}/Casa.cpp -o ${BUILD_DIR}/Casa.o

${BUILD_DIR}/Cliente.o: ${INCLUDE_DIR}/Cliente.hpp ${ENTIDADES_DIR}/Cliente.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${ENTIDADES_DIR}/Cliente.cpp -o ${BUILD_DIR}/Cliente.o

${BUILD_DIR}/Cobertura.o: ${INCLUDE_DIR}/Cobertura.hpp ${ENTIDADES_DIR}/Cobertura.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${ENTIDADES_DIR}/Cobertura.cpp -o ${BUILD_DIR}/Cobertura.o

${BUILD_DIR}/Imovel.o: ${INCLUDE_DIR}/Imovel.hpp ${ENTIDADES_DIR}/Imovel.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${ENTIDADES_DIR}/Imovel.cpp -o ${BUILD_DIR}/Imovel.o

${BUILD_DIR}/main.o: ${INCLUDE_DIR}/Apartamento.hpp ${INCLUDE_DIR}/Casa.hpp ${INCLUDE_DIR}/Cliente.hpp ${INCLUDE_DIR}/Cobertura.hpp ${INCLUDE_DIR}/Imovel.hpp ${SRC_DIR}/main.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR} -c ${SRC_DIR}/main.cpp -o ${BUILD_DIR}/main.o

# Rule for cleaning files generated during compilation. 
# Call 'make clean' to use it
clean:
	rm -f ${BUILD_DIR}/*