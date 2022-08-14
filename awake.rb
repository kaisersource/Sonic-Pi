#Author: KaiserSource

entrance = [
  [:Db5] * 32,
  [:Bb4] * 16,
  [:Eb5] * 6,
  [:Db5] * 10,
].flatten


bass_riff = [
  [:As3] * 16,
  [:Cs4] * 6,
  [:Fs3] * 26,
  [:As2] * 6,
  [:Fs3] * 7,
  [:Ds3] * 3,
].flatten

guitar_riff = [
  [nil] * 1,
  [:As5] * 1,
  [nil] * 1,
  [:As5] * 1,
  [:F5, :Cs5] * 3,
  [:Ab5,:Db5] * 1,
  [:Ab5] * 2,
  [:F5], [:Cs5] * 1,
  [nil] * 1,
  [:As5] * 1,
  [nil] * 1,
  [:As5] * 1,
  [:F5, :Cs5] * 3,
  [:Ab5,:Db5] * 1,
  [:Ab5] * 2,
  [:C6] * 1,
  [nil] * 1,
].flatten


live_loop :entrance do
  with_fx :echo do
    #2048.times do |i|
    use_synth :blade
    entrance.each do |note|
      play note, amp: 0.20
      sleep 0.15
    end
    #end
  end
end

live_loop :guitar do
  with_fx :reverb do
    sleep 38.4
    2048.0.times do |i|
      use_synth :bass_foundation
      guitar_riff.each do |note|
        play note
        sleep 0.3
      end
    end
  end
end

live_loop :bass do
  use_synth :fm
  bass_riff.each do |note|
    play note, amp: 0.5
    sleep 0.15
  end
end


live_loop :drum do
  sleep 19.2
  2048.times do |i|
    sample :drum_bass_hard if i % 4 == 0
    sample :drum_cymbal_closed if i % 1 == 0
    sample :drum_snare_hard   if i % 8 == 4
    sleep 0.15
  end
  
end
