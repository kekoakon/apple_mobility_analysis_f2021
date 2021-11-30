STATE		:= California
SPACE		:= $() $()
STATE_NO_SPACE	:= $(subst $(SPACE),_,$(STATE))
REPORT		:= Analysis_$(STATE_NOSPACE).html
OUTPUT		:= output
REPORT_PATH	:= $(OUTPUT)/$(REPORT)
R_FUNCTION	:= $(wildcard code/functions/*.R)
MOBILITY_DATA	:= data/raw_data/applemobilitytrends-2021-09-22.csv
SEQ_DATA	:= /blast-db/sars-cov-2-seq-data/2021-10-24_ncbi_sars_cov2_sequences.fasta.gz
SEQ_SUMMARY	:= $(OUTPUT)/sequence_summary.txt

all: $(REPORT_PATH)

$(REPORT_PATH): Analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILTIY_DATA) run_analyze_covid_pipeline.sh
	bash run_analyze_covid_pipeline.sh "$(STATE)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$(SEQ_SUMMARY): code/process_sequences.sh $(SEQ_DATA)
	bash code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"

clean:
	rm -fv output/*.html
	rm -fv Analysis.html
	rm -fv output/*summary.txt
	rm -fv output/*/*.csv
	rm -fv output/*/*.png
