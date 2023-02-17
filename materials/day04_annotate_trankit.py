from trankit import Pipeline, trankit2conllu
import os

def main():
    # input and output directories; change as needed
    input_dir = "data/chatgpt-stories"
    output_dir = "data/chatgpt-stories/conllu"

    # create desired output directory if it doesn't already exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # set up trankit's NLP pipeline
    # executing the following lines for the first time will also download the necessary files -- note that some of these are quite large
    nlp = Pipeline(lang="english", gpu=True)  # set gpu=False if your computer doesn't have a modern GPU
    nlp.add('german')  # add further languages
    nlp.add('chinese')
    nlp.add('french')
    nlp.set_auto(True)  # automatically detect which language to annotate (NB: this only works at the document level, sadly)

    # read files in the input directory to process them
    with os.scandir(input_dir) as files:
        for file in files:
            if file.name.endswith(".txt") and file.is_file():
                out_file = os.path.splitext(file.name)[0]
                out_file = os.path.join(output_dir, out_file) + ".conllu"  # file name for output file

                with open(file.path, encoding="UTF-8") as f:
                    text = f.read()  # read file (at once, since our files are small)

                    json_doc = nlp(text)  # apply NLP pipeline, resulting in JSON output
                    conllu_doc = trankit2conllu(json_doc)  # convert to CONLL-U format, see https://universaldependencies.org/format.html

                    with open(out_file, "w", encoding="UTF-8") as f_out:
                        print(conllu_doc, file=f_out)  # write CONLL-U output to file


if __name__ == "__main__":
    main()
