use_bpm 72

x = 2048

bass_riff = [
  [:F3] * 7,
  [:Ab3] * 9,
  [:Bb3] * 7,
  [:Db4] * 9,
].flatten

piano_riff = [
  [:F2] * 1,
  [:C3] * 1,
  [:Eb3] * 1,
  [:G3] * 1,
  [:Ab3] * 1,
  [:Bb3] * 1,
  [:Eb4] * 1,
  [:Ab2] * 1,
  [:Eb3] * 1,
  [:G3] * 1,
  [:C4] * 1,
  [:Eb4] * 1,
  [:F4] * 1,
  [:G4] * 1,
  [:Eb4] * 1,
  [:C4] * 1,
  [:C3] * 1,
  [:Eb3] * 1,
  [:G3] * 1,
  [:C4] * 1,
  [:Eb4] * 1,
  [:G4] * 1,
  [:Bb4] * 1,
  [:Ab2] * 1,
  [:C3] * 1,
  [:Eb3] * 1,
  [:C5] * 1,
  [:Bb4] * 1,
  [:Ab4] * 1,
  [:G4] * 1,
  [:Eb4] * 1,
  [:C4] * 1,
].flatten

guitar_riff = [
  [:C4] * 1,
  [:G4] * 1,
  [:Bb4] * 1,
  [:D5] * 1,
  [:Eb5] * 1,
  [:F5] * 1,
  [:G5] * 1,
  [:Eb4] * 1,
  [:G4] * 1,
  [:Bb4] * 1,
  [:D5] * 1,
  [:Eb5] * 1,
  [:Ab5] * 1,
  [:Bb5] * 1,
  [:G5] * 1,
  [:D5] * 1,
  [:F4] * 1,
  [:C5] * 1,
  [:Eb5] * 1,
  [:G5] * 1,
  [:Ab5] * 1,
  [:Bb5] * 1,
  [:C6] * 1,
  [:Ab4] * 1,
  [:C5] * 1,
  [:D5] * 1,
  [:Bb5] * 1,
  [:Ab5] * 1,
  [:G5] * 1,
  [:Eb5] * 1,
  [:C5] * 1,
  [:Eb5] * 1,
  
].flatten


live_loop :piano do
  use_synth :piano
  piano_riff.each do |note|
    play note, amp: 0.5
    sleep 0.20
  end
end

sleep 6.4
live_loop :bass_riff do
  use_synth :fm
  bass_riff.each do |note|
    play note, amp: 0.5
    sleep 0.20
  end
end

sleep 6.4
live_loop :guitar do
  use_synth :piano
  guitar_riff.each do |note|
    play note, amp: 0.7, decay: 0.7
    sleep 0.20
  end
end

sleep 6.4
live_loop :drum do
  x.times do |i|
    sample :drum_bass_hard, amp: 0.7 if i % 8 == 0
    sample :drum_bass_soft  if i % 16 == 1
    sample :drum_bass_soft  if i % 16 == 3
    sample :drum_bass_soft  if i % 8 == 5
    sleep 0.20
  end
end

sleep 6.4
live_loop :drum_snare do
  x.times do |i|
    sample :drum_snare_hard, amp: 0.7 if i % 16 == 4
    sleep 0.20
  end
end

sleep 6.4
live_loop :cymbal do
  x.times do |i|
    sample :drum_cymbal_soft, amp: 0.5 if i % 2 == 0
    sleep 0.20
  end
end




