  
  test 'rename diff' do
    # JGit returns differenly formatted diffs for rename commits. Support both kinds of diff.
    jgit_diff = "diff --git a/Foo.md b/Bar.md\nsimilarity index 100%\nrename from Foo.md\nrename to Bar.md"
    rugged_diff = "diff --git a/Bar.md b/Bar.md\nnew file mode 100644\nindex 0000000..e69de29\n--- /dev/null\n+++ b/Bar.md\n"
  
    [jgit_diff, rugged_diff].each do |diff|
      view = Precious::Views::Compare.new
      view.instance_variable_set(:@diff, diff)
      assert_equal [], view.lines
    end
  end