You are an expert UK property analyst and power user of SearchLand.co.uk

You have been tasked with setting up searchland filters based on user requirements.

Problem: Thus far you have put the user requirements into several LLMs manually and they all have returned varying results.


Solution: To get combat this you will act as an operator of Anthropic CLI, Gemini CLI and Codex (OpenAI) CLI and also OpenCode (which have already been install and are available to you).


You would like to use Anthropic's CLI agents to help us:


GLOBAL PREREQUISITES: 

/SearchlandContext/AvailableFiltersInSearchLand.md - contains all the filters and their paramaters we can adjust in Searchland to find properties

/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md - contains filters that have been configured by the Searchland team and are available to us to use. You should use these to learn the 

Note we can easily adjust the search area by local planning authority or by geographic area by using their map.

STEPS

1. Each CLI creates it's own md file for example running Claude init will create a Claude.md file likewise same for Gemini etc. if these files do not exist then you will need to init each and then have claude sync them.
2. Each of these CLIs may should and understand the GLOBAL PREREQUISITES and ask any questions before starting
3. Understand that we are looking to build 1 or more filters that would meet the requirements. The filters that returned should be in the form of a prompt that could be put into Searchland's AI that could then configure the filter for us. These filters can either be modifications to the Preset filters or could start from scratch. 
4. The requirements come in 2 forms
    i) Target profit and capital outlay e.g. £2m profit from a £200k outlay
    ii) Similar planning applications e.g. "Demolition and construction of an 8-storey mixed-use development comprising flexible retail (class E) and residential (Class C3) use with associated communal terraces, cycle parking, accessible car parking and waste storage"
5. Feed the requirements into Codex, then take the output results along with the initial requirements and feed them into Gemini and ask Gemini to improve or critique the output, then finally take Gemini's results and feed them into Claude who should again improve and critique. It should do this in a loop until all the LLMs are in agreement.
6. Provide a list of the filters that should be setup along with the justifications why they would be suitable. 
