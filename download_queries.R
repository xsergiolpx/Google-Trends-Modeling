# Select the queries


words = c('victim', 'certify', 'statistics', 'misunderstanding', 'tragic', 'oppressed', 'solitary', 'paranoid', 'personal', 'insecure', 'counsel', 'tragedy', 'cruel', 'overcome', 'parents', 'suicidal', 'dreary', 'inability', 'fight', 'unique', 'joking', 'attention', 'disease', 'tearful', 'involvement', 'sugar', 'injured', 'monitor', 'happy', 'catatonic', 'prevent', 'interfere', 'fatigue', 'necessary', 'listening', 'talking', 'uncertain', 'unfulfilled', 'triumph', 'prevention', 'defensive', 'indicator', 'gloomy', 'broken', 'adolescents', 'shattered', 'empty', 'low', 'need', 'donut', 'anxiety', 'sorrow', 'progress', 'esteem', 'inactivity', 'blue', 'stigma', 'unhappy', 'hard work', 'studies', 'sad', 'fatigued', 'quality', 'love', 'melancholia', 'withdrawn', 'patience', 'crying', 'confide', 'security', 'die', 'blase', 'do i have depression', 'exhausted', 'insomnia', 'vulnerable', 'drugs', 'organize', 'sleep', 'melancholy', 'desperate', 'anxious', 'protect', 'fast food', 'awareness', 'death', 'opinion', 'suicide', 'rejected', 'health', 'breakdown', 'unusual', 'irritable', 'fear', 'disinterest', 'cycle', 'withdrawal', 'caregiver', 'inadequate', 'consumed', 'source', 'doctor', 'agency', 'wounded', 'education', 'concern', 'treat', 'abandoned', 'dreadful', 'problem', 'amenorrhea', 'miserable', 'weight loss', 'excluded', 'family', 'negative', 'prescription', 'effect', 'label', 'grouchy', 'troubled', 'distressed', 'world health organization', 'distractable', 'understanding', 'low sex drive', 'weak', 'morbid', 'cooperative', 'sport', 'mental health', 'dejected', 'inconsolable', 'nightmarish', 'freaking', 'mental', 'suffer', 'option', 'endure', 'diet', 'pessimism', 'poor', 'knowledgeable', 'resulting', 'confusion', 'tack', 'clarity', 'unhinged', 'lack', 'crisis', 'hurt', 'irritability', 'hot-line', 'quantity', 'antisocial', 'youth', 'lousy', 'weepy', 'time', 'guideline', 'abnormal', 'desolate', 'alone', 'lonely', 'agitated', 'unsettling', 'hopeless', 'sadness', 'kill', 'attitude', 'discrimination', 'hopelessness', 'cure', 'forlorn', 'warning', 'grief', 'conclude', 'programs', 'requirement', 'eat', 'bipolar', 'moody', 'oncoming', 'heal', 'distracted', 'brittle', 'anguish', 'immune', 'tentative', 'condition', 'succor', 'substance abuse', 'degree', 'progressive', 'self-conscious', 'signs', 'overwhelmed', 'pay attention', 'zero', 'fatalistic', 'devastated', 'suffering', 'exercise', 'knowledge', 'gain', 'woeful', 'patient', 'finality', 'isolation', 'jeer', 'quest', 'panic', 'review', 'debilitating', 'tired', 'trajectory', 'wretched', 'pills', 'touchy', 'medicine', 'defeated', 'uneasy', 'wailing', 'nervous', 'nothing', 'scared', 'anger', 'burger', 'sorrowful', 'achy', 'doomed', 'ability', 'improvement', 'treatment', 'worthless', 'thoughts', 'separation', 'psychiatrist', 'symptoms', 'detriment', 'evaluation', 'normal', 'watch', 'brain', 'appetite loss', 'bikini', 'thesis', 'sobbing', 'report', 'peers', 'upset', 'needy', 'abuse', 'interested', 'clinical', 'down', 'skills', 'irrational', 'cope', 'hereditary', 'all ages', 'disheartened', 'sympathetic', 'friends', 'level', 'antidepressant', 'communication', 'alarm', 'reality', 'medication', 'physician', 'pattern', 'disorder', 'worry', 'therapy', 'reckless', 'crushed', 'attempt', 'strength', 'fat', 'distraught', 'query', 'pizza', 'courage', 'despondent', 'pessimistic', 'data', 'issues', 'descent', 'depressed', 'isolated', 'teenagers', 'struggle', 'dismal', 'seriousness', 'siblings', 'depression', 'fragile', 'terrified', 'child', 'feelings', 'discontented', 'afraid', 'aid', 'validation', 'trapped', 'despair', 'help', 'pain', 'overeating', 'observation', 'grieving', 'uncomfortable', 'agony', 'unpredictable', 'affect', 'dog days', 'demoralized', 'media', 'talk', 'alienation', 'helpless', 'diagnosis')

library(gtrendsR)
# Years to download
year_2011 = "2011-01-01 2011-12-31"
year_2012 = "2012-01-01 2012-12-31"
year_2013 = "2013-01-01 2013-12-31"
year_2014 = "2014-01-01 2014-12-31"
year_2015 = "2015-01-01 2015-12-31"
year_2016 = "2016-01-01 2016-12-31"
year_all = "2011-01-01 2017-12-31"

years = c(year_2011, year_2012, year_2013, year_2014, year_2015, year_2016, year_all)
years_names = c("2011", "2012", "2013", "2014", "2015", "2016", "all")

# Download ans save to csv files
counter = 0
for(word in words){
  counter = counter + 1
  print(paste(counter, length(words), word))
  dir.create(word)
  for( i in c(1:length(years))){
    year = years[i]
    df = gtrends(word, time = year, geo = "US")
    write.csv2(df$interest_over_time, file = paste(word, "/", word, "_interest_over_time_", years_names[i], ".csv", sep = ""))
    write.csv2(df$interest_by_region, file = paste(word, "/", word, "_interest_by_region_", years_names[i], ".csv", sep = ""))
  }
}

print("Finished!")

