require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-")
      seed = random_seed

      build(seed, token_range, delimiter)
    end

    private

    def build(seed, token_range, delimiter)
      sections = [
        adjectives[seed % adjectives.length],
        nouns[seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        ancient autumn blue bold captivating charming colorful
        compelling cool crimson dawn delicate delightful dry
        enchanting essential floral fragrant frosty green hidden
        icy imaginary lingering little lively long magical
        marvelous misty morning muddy nameless patient peaceful
        polished proud purple quiet red refreshing restless shy
        silent small snowy sparkling splendid spring still sublime
        summer tranquil twilight unforgettable violet wandering
        weathered white wild winter wispy wonderful young 
      )
    end

    def nouns
      %w(
        waterfall river breeze moon rain wind sea morning
        snow lake sunset pine shadow leaf dawn glitter forest
        hill cloud meadow sun glade bird brook butterfly
        dew dust field fire flower firefly feather grass
        haze mountain night pond darkness snowflake silence
        sound sky shape surf thunder water wildflower
        wave water resonance sunshine wood dream tree fog
        frost voice paper smoke star horizon
      )
    end
  end
end
