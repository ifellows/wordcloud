\name{comparison.cloud}
\alias{comparison.cloud}
\title{
  Plot a comparison cloud
}
\description{
  Plot a cloud comparing the frequencies of words across documents.
}
\usage{
comparison.cloud(term.matrix,scale=c(4,.5),max.words=300,
	random.order=FALSE,rot.per=.1,
	colors=brewer.pal(ncol(term.matrix),"Dark2"),
	use.r.layout=FALSE,title.size=3,...)
}
\arguments{
  \item{term.matrix}{A term frequency matrix whose rows represent words and whose columns represent documents.}
  \item{scale}{A vector of length 2 indicating the range of the size of the words. }
  \item{max.words}{Maximum number of words to be plotted. least frequent terms dropped}
  \item{random.order}{plot words in random order. If false, they will be plotted in decreasing frequency}
  \item{rot.per}{proportion words with 90 degree rotation}
  \item{colors}{color words from least to most frequent}
  \item{use.r.layout}{if false, then c++ code is used for collision detection, otherwise R is used}
  \item{title.size}{Size of document titles}
  \item{...}{Additional parameters to be passed to text (and strheight,strwidth).}
}
\details{
Let \eqn{p_{i,j}} be the rate at which word i occurs in document j, and \eqn{p_j} be the
average across documents(\eqn{\sum_ip_{i,j}/ndocs}). The size of each word is mapped to its maximum deviation
( \eqn{max_i(p_{i,j}-p_j)} ), and its angular position is determined by the document where that maximum occurs.
}
\value{
nothing
 }
\examples{

if(require(tm)){
	data(SOTU)
	corp <- SOTU
	corp <- tm_map(corp, removePunctuation)
	corp <- tm_map(corp, content_transformer(tolower))
	corp <- tm_map(corp, removeNumbers)
	corp <- tm_map(corp, function(x)removeWords(x,stopwords()))

	term.matrix <- TermDocumentMatrix(corp)
	term.matrix <- as.matrix(term.matrix)
	colnames(term.matrix) <- c("SOTU 2010","SOTU 2011")
	comparison.cloud(term.matrix,max.words=40,random.order=FALSE)
	commonality.cloud(term.matrix,max.words=40,random.order=FALSE)
}

}
