package updater_test

import (
	"flag"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"k8s.io/klog/v2"
)

func TestUpdater(t *testing.T) {
	RegisterFailHandler(Fail)

	klog.InitFlags(nil)
	// Set v to 5 for verbose output
	Expect(flag.Set("v", "-1")).To(Succeed())
	flag.Parse()

	RunSpecs(t, "Updater Suite")
}
