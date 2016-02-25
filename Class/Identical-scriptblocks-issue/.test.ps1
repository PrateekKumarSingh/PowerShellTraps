
if ($PSVersionTable.PSVersion.Major -lt 5) {return task test5}

task Test-1.fails {
	($r = try {.\Test-1.fails.ps1} catch {$_})
	equals $r.Count 2
	assert ($r[0].GetType().FullName -cmatch '^<\w{8}>\.A$')
	equals $r[1].FullyQualifiedErrorId TypeNotFound
}

task Test-2.works {
	($r = .\Test-2.works.ps1)
	equals $r.Count 2
	$r0 = $r[0].GetType().FullName
	$r1 = $r[1].GetType().FullName
	assert ($r0 -cmatch '^<\w{8}>\.A$')
	assert ($r1 -cmatch '^<\w{8}>\.A$')
	assert ($r0 -ne $r1)
}
