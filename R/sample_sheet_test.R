sampleSheetTest <- function(file) {
        ## 'file' is a csv file for the miSeq 
        ## the script will calculate if both channels are being used
		
	channels <- data.frame(Red=numeric(0),Green=numeric(0))
		
	dat <- read.csv(file,skip=19,header=F,col.names=c("Sample_Name","A","B","C","Barcode_ID","Barcode_Sequence","E","F"))
		
	cat("\n")
	cat("These are your barcodes.....","\n")
	cat("\n")
		
	print(dat[,c("Sample_Name","Barcode_ID","Barcode_Sequence")])
		
	seqs <- dat$Barcode_Sequence
	
	
	# interate through the sequences and see what channels are being used
	for(i in 1:7){
		
		redChannel = 0
		greenChannel =0
		
		for(base in seqs){
			
			# Test for red channel
			if(substring(base,i,i) == "A" | substring(base,i,i) == "C"){
			
				redChannel = redChannel + 1
				
			}
			# Test for green channel	
			if (substring(base,i,i) == "T" | substring(base,i,i) == "G"){
				
				greenChannel =  greenChannel +1
				
			}
				
		}
			
		temp <- data.frame(Red=redChannel, Green=greenChannel)
			
		channels <- rbind(channels,temp)
				
	}
		
	row.names(channels) <- c("Base 1",
				 "Base 2",
				 "Base 3",
				 "Base 4",
				 "Base 5",
				 "Base 6",
				"Base 7")
		
		
	cat("\n")
	cat("Number of bases per channel..... red or green must not = 0","\n")
	cat("Red = A or C, Green = G or T","\n")
	cat("\n")
					 
	print(channels)
		
	par(xpd=TRUE,mar=c(5,4,4,5))
	barplot(t(channels),col=c("red","green"),xlab="Barcode position",ylab="Red and Green Counts")
	legend(par("usr")[2],par("usr")[4],c("Red","Green"),pch=15,col=c("red","green"))
	cat("\n")
	cat("Finished plot","\n")
	cat("\n")

}
