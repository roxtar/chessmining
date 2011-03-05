PCAplot = function(X, Xnames, Xcolors) {
   ## PCA plot using the correlation matrix
   n = dim(X)[1]
   p = dim(X)[2]
   corX = cor(X)
   corSVD = svd(corX)
   U = corSVD$u
   lambda = corSVD$d
   xaxis = as.matrix( U[,1] )
   yaxis = as.matrix( U[,2] )
   if (sum(sign(xaxis)) < 0) xaxis = -xaxis  # choose the sign of the axis so as to maximize the number of positive factors
   if (sum(sign(yaxis)) < 0) yaxis = -yaxis  # choose the sign of the axis so as to maximize the number of positive factors
   points =  scale(X)
   xpoints = points %*% xaxis
   ypoints = points %*% yaxis
   xdim = xaxis * max(abs(xpoints))/max(abs(xaxis)) * 0.85
   ydim = yaxis * max(abs(ypoints))/max(abs(yaxis)) * 0.85
   xmax = max(abs(range(xpoints)))
   ymax = max(abs(range(ypoints)))
   plot(xpoints,ypoints, col=Xcolors, pch=20,  main=paste("Principal Components"),
      xlim = c(-xmax,xmax), ylim = c(-ymax,ymax),
      xlab="1st component", ylab="2nd component", cex=0.6, cex.main=1.5, cex.lab=1.2, cex.axis=1.2)
   for (i in 1:n) {text( xpoints[i], ypoints[i], Xnames[i], offset=0.2, pos=4, col="black",cex=0.35)}
   positions = 2*(xdim > -ydim) + (abs(xdim) > abs(ydim)) + 1
   for (i in 1:p) {text( xdim[i]+0.025, ydim[i], colnames(X)[i], pos=positions[i], offset=0.2, col="blue",cex=0.65)}
   for (i in 1:p) {arrows(0,0, xdim[i], ydim[i], col="darkgray", angle=3, lwd=0.5)}
   arrows(0,0,1,0, col="black", angle=3, lwd=0.5)
   arrows(0,0,0,1, col="black", angle=3, lwd=0.5)
   ### for (i in 1:p) {text(xpoints[i]-0.025, ypoints[i], full_colnames[i], pos=4, col="black",cex=cexScale)}
   ### EigenSummary =  cbind( colnames(X), round(xaxis,digits=3), round(yaxis,digits=3), round(lambda,digits=3) )
   xp = -xmax * 0.95
   yp = -ymax * 0.80
   dp = (max(ypoints) - min(ypoints)) / 30
   text( xp, yp - 0*dp, paste("lambda_1 = ", round(lambda[1],2), " (", round(100*lambda[1]/p), "%)", sep=""), pos=4,col="red",cex=0.75)
   text( xp, yp - 1*dp, paste("lambda_2 = ", round(lambda[2],2), " (", round(100*lambda[2]/p), "%)", sep=""), pos=4,col="red",cex=0.75)
   text( xp, yp - 2*dp, paste("lambda_3 = ", round(lambda[3],2), " (", round(100*lambda[3]/p), "%)", sep=""), pos=4,col="red",cex=0.75)
}

demo = function() {
   data(iris)
   iris_data = iris[,1:4]
   iris_colors = c("red","green","blue")[unclass( iris[,5] )]
   iris_names = (1:150)
   PCAplot(iris_data, iris_names, iris_colors)
}
