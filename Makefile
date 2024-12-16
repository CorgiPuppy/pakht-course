EXQU_DIR := exam_quastions

EXQU := $(EXQU_DIR)/exam_quastions.pdf

PDFLTX := pdflatex
OUTPUT := --output-directory

.PHONY: all

all: clean run-report clean-aux

run-report: $(EXQU)
	@echo "Running a report.."
	@zathura $<

$(EXQU): $(EXQU_DIR)/*.tex
	@echo "Building pdf.."
	$(PDFLTX) $(OUTPUT)=$(EXQU_DIR) $<
	$(PDFLTX) $(OUTPUT)=$(EXQU_DIR) $<

clean-aux:
	@echo "Cleaning up auxiliary files.."
	@find $(EXQU_DIR) -type f ! -name '*.pdf' ! -name '*.tex' -delete

clean:
	@echo "Cleaning up a report.."
	@$(RM) $(EXQU)
