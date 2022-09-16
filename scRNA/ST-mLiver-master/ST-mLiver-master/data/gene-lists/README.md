# Marker genes generated by DGEA of ST data and single cell data of the MCA according to the RMarkdown documention provided in this study. Markers were used to define central and portal clusters in this study

* ST-central-markers.csv - central vein markers (cluster 2) of ST data using the `Liver-ST` script
* ST-portal-markers.csv - portal vein markers (cluster 1) of ST data using the `Liver-ST` script
* sc-central-markers.csv - central hepatocyte markers of MCA single cell data data using the `Liver-ST` script
* sc-portal-markers.csv - portal hepatocyte markers of MCA single cell data data using the `Liver-ST` script
* markers_cluster5.txt - vector of marker genes of cluster 5 generated using the `Liver-ST` script
* markers_cluster5.txt - vector of overlapping marker genes of `markers_cluster5.txt` and `sc-halpern/lcms/lcm_all.txt` from DGEA performed in `scripts/review-ST-Liver-scAnalysis.Rmd` 
* sc-halpern/ - folder containing short lists and complete lists of DEG for annotated celltypes retrieved using `scripts/review-ST-Liver-scAnalysis.Rmd` to generate expression by distance plots for revision process
* st-lec/ - folder containing short and complete lists of marker genes for the annotated celltypes `endo` for endothelial cells, `kupffer` for kupffer cells and `lcm` for liver capsular macrophages extracted using `scripts/review-ST-Liver-scAnalysis.Rmd` which are also present in our spatial data
* immune_short.txt - shortlist of genes beloning to the GO-term immune-system process exhibiting DE between cluster 1 and cluster 2 in the spatial data
* bivarite_exp_dist/wnt_short - shortlist of 12 genes of wnt regulated genes with highets Log2FC in cluster 2 (central cluster), expect for genes "axin2" and "Lgr5" which represent requested wnt target genes

* bivarite_exp_dist/glucagon_targets - shortlist of 12 genes of glucagon regulated genes with highets Log2FC in cluster 1 (portal cluster), expect for genes "Mup20" and "Mmd2" which represent the highest positive or negative regulation by glucagon according to (PMID: 29555772), reespectively.

