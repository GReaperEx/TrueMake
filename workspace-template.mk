# This makefile deliberately serializes the building process, so as to
# facilitate priority. Leftmost projects are built first, ensuring corrent
# compilation for dependant (rightmost) ones

# The project folders you want to build
PROJECTS := bar
# The collective compilation target of all these projects
TARGET := debug

all :
	@$(foreach proj,$(PROJECTS),make -C $(proj) $(TARGET) && )true;
