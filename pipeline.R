# Load plotly library for data visualization
library(plotly)

# Create nodes for each step in the analysis
nodes <- data.frame(
  id = c("QC", "Alignment", "Quantification", "Functional analysis", "Validation", "Visualization", "Report"),
  label = c("Quality control (QC) of raw sequencing data", "Alignment of sequencing reads to a reference genome",
            "Quantification of gene expression levels", "Functional analysis of differentially expressed genes",
            "Validation of differentially expressed genes", "Visualization of results", "Report generation")
)

# Create edges to connect the nodes
edges <- data.frame(
  from = c("QC", "Alignment", "Quantification", "Quantification", "Functional analysis", "Validation", "Visualization"),
  to = c("Alignment", "Quantification", "Functional analysis", "Validation", "Visualization", "Report", "Report")
)

# Create a plotly graph using the nodes and edges
plot_ly(
  type = "sankey",
  arrangement = "snap",
  node = list(
    label = nodes$label,
    pad = 15,
    thickness = 20,
    color = "rgba(0, 102, 204, 0.8)",
    line = list(color = "black", width = 0.5)
  ),
  link = list(
    source = match(edges$from, nodes$id) - 1,
    target = match(edges$to, nodes$id) - 1,
    value = 1
  )
)
