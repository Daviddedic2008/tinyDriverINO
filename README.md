wohoo pushed from microchip studio. 

figured out how to read from LCD ram!

these drivers support reading/writing to LCD ram, drawing in pixels, clearing the screen, drawing rectangles, and manually setting bounds/drawing whatver you want. It also had horizontal and vertical line subroutines, but they were no more efficient than the rectangle subroutine so i removed them. Diagonal lines are present in an unstable build, and I am working on a 3d wireframe renderer using diagonal lines right now.
