class Tag < ActiveRecord::Base

  def self.find_adj_nouns_verbs (text)
    tagged = $tgr.add_tags(text)
    tags = {}
    unless text.strip.empty?
      tags = tags.merge Hash[($tgr.get_nouns(tagged)).sort_by { |k,v| -v }[0..1]]
      verb_tags = Hash[($tgr.get_infinitive_verbs(tagged).merge($tgr.get_past_tense_verbs(tagged).merge($tgr.get_gerund_verbs(tagged).merge($tgr.get_passive_verbs(tagged).merge($tgr.get_base_present_verbs(tagged).merge($tgr.get_present_verbs(tagged)){|key, first, second| first + second }) { |key, first, second| first + second }){ |key, first, second| first + second }){ |key, first, second| first + second }){ |key, first, second| first + second })]
      verb_tags.delete("'m")
      verb_tags.delete("was")
      verb_tags.delete("is")
      tags = tags.merge verb_tags.sort_by { |k,v| -v }[0..0]
      tags = tags.merge Hash[($tgr.get_adjectives(tagged)).sort_by { |k,v| -v }[0..2]]
    end
  end

end
