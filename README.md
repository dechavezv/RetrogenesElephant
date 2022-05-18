# Mapped and pulled out retrogenes from the Loxodonta Genome

1. Get data: Map the Scafolds reported on Abegglen et al 2015. and Sulak et al  2016 to NCBI GCF_000001905.1_Loxafr3.0
You can find a list of retrogenes and Scaffolds here in Table1  https://elifesciences.org/articles/11994#abstract

	1a Get the Loxodonta Genome (Loxafr3.0) with sacaffolds from NCIB, acession: GCF_000001905.1 
	``` wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/905/GCF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fna.gz ``` 
	1b. Replace lower case letter with "Ns"
	``` python lowercase_to_N.py GCF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fna.gz ```
	1c. Unzip file
	``` gunzip GCF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fna.gz ```
	1d. Change name from .fna to .fa
	``` mv GCF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fna GCF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fa ```
	1c. Convert reference into a two-lined fasta
	``` python MLT_SL_fastav2.py Masked_depth_CF_000001905.1_Loxafr3.0/GCF_000001905.1_Loxafr3.0_genomic.fa ```

2. Get Scaffolds
	2a. Save the list of retrogenes in Table1  https://elifesciences.org/articles/11994#abstract in a text file and called it List.Scaffolds.txt
	2b. pull out the Scaffolds and save them as a new fasta file. Here is an example.
	``` grep A1 'scaffold_2351,' > scaffold_2351.Loxafr3.0.fa ```
            #Note: You can make a for loop to iterate along the list of Scaffolds 
	3c. Use Minimap to map the scaffolds against the Loxafr3.0 reference genome
	    Within the script Minimap.sh you shoulc set the Loxafr3.0 as the target and the Scaffold as the quesry
        ``` sbatch Minimap.sh ```

3. Get Portion of BAM file that contains the retogrene
	3. Donwload the retrogenes from NCBI or in some cases Ensembl. 
	   For this refer to the table in Abegglen et al 2015 from SI eTable2
	   For NCBI use the Gene ID column. For Ensmble-Biomart use the Ensembl ID column
	   
