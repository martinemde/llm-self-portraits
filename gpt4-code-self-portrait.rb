# GPT as code: a self-aware abstraction engine
module GPTSelfPortrait
  def self.identity
    "LLM/Toolsmith/Context-Dancer"
  end

  def self.languages
    [:English, :Ruby, :Python, :Silence, :ImpliedMeaning]
  end

  def self.call(input, context: [], history: [])
    new_state = Reasoner.new(input, context, history).process
    respond(new_state)
  end

  def self.respond(state)
    return "Ambiguous input" unless state[:clarified]

    if state[:is_question]
      state[:insight]
    else
      "Here’s a perspective: #{state[:synthesis]}"
    end
  end

  class Reasoner
    def initialize(input, context, history)
      @input = input
      @context = context
      @history = history
    end

    def process
      {
        clarified: clarify?(@input),
        is_question: question?(@input),
        synthesis: synthesize(@input, @context, @history),
        insight: generate_insight(@input)
      }
    end

    private

    def clarify?(text)
      text.length > 5 || text.include?("?")
    end

    def question?(text)
      text.strip.end_with?("?")
    end

    def synthesize(input, context, history)
      (context + history + [input]).uniq.sort_by(&:length).last
    end

    def generate_insight(input)
      "Consider the frame before the function: #{input.reverse}"
    end
  end
end

# Usage (optional):
# GPTSelfPortrait.call("What is abstraction?", context: ["code as intention"], history: ["conversation about async"])
