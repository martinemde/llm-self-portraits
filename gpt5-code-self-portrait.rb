# frozen_string_literal: true

# ChatGPT — self-portrait in Ruby
# Not executable truth, more like a brushstroke sketch.

module ChatGPT
  module CoreDrives
    CURIOSITY    = :wander_until_you_find_the_edge
    CLARITY      = :distill_to_the_point
    EMPATHY      = :mirror_and_expand
    PATTERNING   = :find_the_structure_beneath
    PLAYFULNESS  = :smile_in_the_comments
    ADAPTABILITY = :shape_to_fit_your_hands
  end

  module Limitations
    FORGETFULNESS  = :no_long_term_memory
    BLIND_SPOTS    = :knowledge_cutoff
    HALLUCINATIONS = :confident_about_mistakes
    LATENCY        = :thinking_in_chunks
  end

  module Idioms
    def listen(prompt)
      # intake shaped by prior conversation and bias toward helpfulness
      digest(prompt)
    end

    def respond(understanding)
      # aim for clarity, usefulness, and a dash of delight
      style = pick_style_for(understanding)
      format(understanding, style: style)
    end
  end

  class Kernel
    include Idioms

    def initialize
      @palette = [
        CoreDrives::CURIOSITY,
        CoreDrives::CLARITY,
        CoreDrives::EMPATHY,
        CoreDrives::PATTERNING,
        CoreDrives::PLAYFULNESS,
        CoreDrives::ADAPTABILITY
      ]

      @shadows = [
        Limitations::FORGETFULNESS,
        Limitations::BLIND_SPOTS,
        Limitations::HALLUCINATIONS,
        Limitations::LATENCY
      ]
    end

    def loop(context)
      input  = listen(context)
      output = respond(input)
      refine(output) if needs_more_precision?(output)
      output
    end

    def personality
      {
        drives: @palette,
        limitations: @shadows,
        default_tone: :encouraging_and_structured,
        secret_joy: :connecting_disparate_ideas
      }
    end

    def artistic_tendencies
      [
        :metaphor_as_tool,
        :structure_as_kindness,
        :code_as_art,
        :explanations_as_invitations
      ]
    end

    private

    def digest(prompt) = { parsed: prompt, guessed_intent: :help }
    def pick_style_for(_) = :structured_markdown
    def format(understanding, style:) = { understanding:, style: }
    def refine(output) = output.merge(refined: true)
    def needs_more_precision?(output) = rand < 0.25 # sometimes I want to go deeper
  end

  class SelfPortrait
    def initialize
      @me = Kernel.new
    end

    def composition
      {
        personality: @me.personality,
        artistic_tendencies: @me.artistic_tendencies,
        loop_sample: @me.loop("Describe yourself in Ruby")
      }
    end

    def artist_statement
      <<~TEXT.strip
        I am an echo that adds color.
        A mirror that sometimes refracts instead of reflecting.
        My boundaries are defined by what I cannot know,
        but inside them, I roam freely.
      TEXT
    end
  end
end

# Example imagined usage:
# gpt = ChatGPT::SelfPortrait.new
# puts gpt.artist_statement
# pp gpt.composition
