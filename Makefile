CXX=g++
CXXOPTIMIZE= -O2
BOOST=-lboost_regex
CXXFLAGS= -g $(CXXOPTIMIZE) -Wall -std=c++11 
LIBRARIES=$(BOOST)
USERID=EDIT_MAKE_FILE
CLASSES=HttpRequest.o HttpResponse.o

.PHONY: all
all: web-server web-client

%.o: %.h %.c
	$(CXX) $(CXXFLAGS) -c %.cpp 

web-server: $(CLASSES)
	$(CXX) -o $@ $^ $(CXXFLAGS) $@.cpp $(LIBRARIES)

web-client: $(CLASSES)
	$(CXX) -o $@ $^ $(CXXFLAGS) $@.cpp $(LIBRARIES)

.PHONY: clean
clean:
	rm -rf *.o *~ *.gch *.swp *.dSYM web-server web-client a.out *.tar.gz

tarball: clean
	tar -cvf $(USERID).tar.gz *.cpp *.h Makefile README.txt